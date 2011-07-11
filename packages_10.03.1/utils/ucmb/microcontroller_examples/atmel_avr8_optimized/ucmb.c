/*
 *   Microcontroller message bus
 *   uc-side slave implementation for Atmel AVR8
 *
 *   The gcc compiler always treats multi-byte variables as litte-endian.
 *   So no explicit endianness conversions are done on the message header,
 *   footer and status data structures.
 *
 *   This hotpath-assembly implementation is about twice as fast
 *   as the C implementation.
 *
 *   Copyright (C) 2009 Michael Buesch <mb@bu3sch.de>
 *
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU General Public License
 *   as published by the Free Software Foundation; either version 2
 *   of the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 */

#include "ucmb.h"

#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>


#ifndef __GNUC__
# error "Need the GNU C compiler"
#endif

#undef __naked
#define __naked		__attribute__((__naked__))
#undef __used
#define __used		__attribute__((__used__))
#undef __noret
#define __noret		__attribute__((__noreturn__))
#undef offsetof
#define offsetof(type, member)	((size_t)&((type *)0)->member)
#undef unlikely
#define unlikely(x)		__builtin_expect(!!(x), 0)
#undef mb
#define mb()			__asm__ __volatile__("" : : : "memory") /* memory barrier */
#ifndef ucmb_errorlog
# define ucmb_errorlog(message)	do { /* nothing */ } while (0)
#endif


struct ucmb_message_hdr {
	uint16_t magic;		/* UCMB_MAGIC */
	uint16_t len;		/* Payload length (excluding header and footer) */
} __attribute__((packed));

struct ucmb_message_footer {
	uint16_t crc;		/* CRC of the header + payload. */
} __attribute__((packed));

struct ucmb_status {
	uint16_t magic;		/* UCMB_MAGIC */
	uint16_t code;		/* enum ucmb_status_code */
} __attribute__((packed));

#define UCMB_MAGIC		0x1337

enum ucmb_status_code {
	UCMB_STAT_OK = 0,
	UCMB_STAT_EPROTO,	/* Protocol format error */
	UCMB_STAT_ENOMEM,	/* Out of memory */
	UCMB_STAT_E2BIG,	/* Message too big */
	UCMB_STAT_ECRC,		/* CRC error */
};


static uint8_t ucmb_buf[sizeof(struct ucmb_message_hdr) +
			UCMB_MAX_MSG_LEN +
			sizeof(struct ucmb_message_footer)] __used;
static uint16_t ucmb_buf_ptr __used;
static struct ucmb_status status_buf __used;
static uint16_t ucmb_send_message_len __used;
static uint8_t ucmb_received_message;

/* The current IRQ handler */
static void (*ucmb_interrupt_handler)(void) __used;


/* Polynomial: x^16 + x^15 + x^2 + 1 */
static const prog_uint16_t crc16_table[256] = {
	0x0000, 0xC0C1, 0xC181, 0x0140, 0xC301, 0x03C0, 0x0280, 0xC241,
	0xC601, 0x06C0, 0x0780, 0xC741, 0x0500, 0xC5C1, 0xC481, 0x0440,
	0xCC01, 0x0CC0, 0x0D80, 0xCD41, 0x0F00, 0xCFC1, 0xCE81, 0x0E40,
	0x0A00, 0xCAC1, 0xCB81, 0x0B40, 0xC901, 0x09C0, 0x0880, 0xC841,
	0xD801, 0x18C0, 0x1980, 0xD941, 0x1B00, 0xDBC1, 0xDA81, 0x1A40,
	0x1E00, 0xDEC1, 0xDF81, 0x1F40, 0xDD01, 0x1DC0, 0x1C80, 0xDC41,
	0x1400, 0xD4C1, 0xD581, 0x1540, 0xD701, 0x17C0, 0x1680, 0xD641,
	0xD201, 0x12C0, 0x1380, 0xD341, 0x1100, 0xD1C1, 0xD081, 0x1040,
	0xF001, 0x30C0, 0x3180, 0xF141, 0x3300, 0xF3C1, 0xF281, 0x3240,
	0x3600, 0xF6C1, 0xF781, 0x3740, 0xF501, 0x35C0, 0x3480, 0xF441,
	0x3C00, 0xFCC1, 0xFD81, 0x3D40, 0xFF01, 0x3FC0, 0x3E80, 0xFE41,
	0xFA01, 0x3AC0, 0x3B80, 0xFB41, 0x3900, 0xF9C1, 0xF881, 0x3840,
	0x2800, 0xE8C1, 0xE981, 0x2940, 0xEB01, 0x2BC0, 0x2A80, 0xEA41,
	0xEE01, 0x2EC0, 0x2F80, 0xEF41, 0x2D00, 0xEDC1, 0xEC81, 0x2C40,
	0xE401, 0x24C0, 0x2580, 0xE541, 0x2700, 0xE7C1, 0xE681, 0x2640,
	0x2200, 0xE2C1, 0xE381, 0x2340, 0xE101, 0x21C0, 0x2080, 0xE041,
	0xA001, 0x60C0, 0x6180, 0xA141, 0x6300, 0xA3C1, 0xA281, 0x6240,
	0x6600, 0xA6C1, 0xA781, 0x6740, 0xA501, 0x65C0, 0x6480, 0xA441,
	0x6C00, 0xACC1, 0xAD81, 0x6D40, 0xAF01, 0x6FC0, 0x6E80, 0xAE41,
	0xAA01, 0x6AC0, 0x6B80, 0xAB41, 0x6900, 0xA9C1, 0xA881, 0x6840,
	0x7800, 0xB8C1, 0xB981, 0x7940, 0xBB01, 0x7BC0, 0x7A80, 0xBA41,
	0xBE01, 0x7EC0, 0x7F80, 0xBF41, 0x7D00, 0xBDC1, 0xBC81, 0x7C40,
	0xB401, 0x74C0, 0x7580, 0xB541, 0x7700, 0xB7C1, 0xB681, 0x7640,
	0x7200, 0xB2C1, 0xB381, 0x7340, 0xB101, 0x71C0, 0x7080, 0xB041,
	0x5000, 0x90C1, 0x9181, 0x5140, 0x9301, 0x53C0, 0x5280, 0x9241,
	0x9601, 0x56C0, 0x5780, 0x9741, 0x5500, 0x95C1, 0x9481, 0x5440,
	0x9C01, 0x5CC0, 0x5D80, 0x9D41, 0x5F00, 0x9FC1, 0x9E81, 0x5E40,
	0x5A00, 0x9AC1, 0x9B81, 0x5B40, 0x9901, 0x59C0, 0x5880, 0x9841,
	0x8801, 0x48C0, 0x4980, 0x8941, 0x4B00, 0x8BC1, 0x8A81, 0x4A40,
	0x4E00, 0x8EC1, 0x8F81, 0x4F40, 0x8D01, 0x4DC0, 0x4C80, 0x8C41,
	0x4400, 0x84C1, 0x8581, 0x4540, 0x8701, 0x47C0, 0x4680, 0x8641,
	0x8201, 0x42C0, 0x4380, 0x8341, 0x4100, 0x81C1, 0x8081, 0x4040
};

static inline uint16_t crc16_block_update(uint16_t crc, const void *_data, uint16_t size)
{
	const uint8_t *data = _data;
	uint8_t offset;

	while (size--) {
		wdt_reset();
		offset = crc ^ *data;
		crc = (crc >> 8) ^ pgm_read_word(&crc16_table[offset]);
		data++;
	}

	return crc;
}

static inline uint16_t ucmb_calc_msg_buffer_crc(void)
{
	const struct ucmb_message_hdr *hdr;
	uint16_t crc = 0xFFFF;

	hdr = (const struct ucmb_message_hdr *)ucmb_buf;
	crc = crc16_block_update(crc, ucmb_buf,
				 sizeof(struct ucmb_message_hdr) + hdr->len);
	crc ^= 0xFFFF;

	return crc;
}

/* The generic interrupt handler.
 * This just branches to the state specific handler.
 */
ISR(SPI_STC_vect) __naked;
ISR(SPI_STC_vect)
{
	__asm__ __volatile__(
"	; UCMB generic interrupt handler		\n"
"	push __tmp_reg__				\n"
"	in __tmp_reg__, __SREG__			\n"
"	push r30					\n"
"	push r31					\n"
"	lds r30, ucmb_interrupt_handler + 0		\n"
"	lds r31, ucmb_interrupt_handler + 1		\n"
"	ijmp ; Jump to the real handler			\n"
	);
}
#define UCMB_IRQ_EPILOGUE \
"	; UCMB interrupt epilogue (start)		\n"\
"	pop r31						\n"\
"	pop r30						\n"\
"	out __SREG__, __tmp_reg__			\n"\
"	pop __tmp_reg__					\n"\
"	reti						\n"\
"	; UCMB interrupt epilogue (end)			\n"

static void __naked __used ucmb_handler_LISTEN(void)
{
	__asm__ __volatile__(
"	push r16						\n"
"	push r17						\n"
"	push r18						\n"
"	lds r16, ucmb_buf_ptr + 0				\n"
"	lds r17, ucmb_buf_ptr + 1				\n"
"	ldi r18, hi8(%[sizeof_buf])				\n"
"	cpi r16, lo8(%[sizeof_buf])				\n"
"	cpc r17, r18						\n"
"	in r18, %[_SPDR]					\n"
"	brsh 1f ; overflow					\n"
"	; Store SPDR in the buffer				\n"
"	movw r30, r16						\n"
"	subi r30, lo8(-(ucmb_buf))				\n"
"	sbci r31, hi8(-(ucmb_buf))				\n"
"	st Z, r18						\n"
"1:								\n"
"	; Increment the buffer pointer				\n"
"	subi r16, lo8(-1)					\n"
"	sbci r17, hi8(-1)					\n"
"	sts ucmb_buf_ptr + 0, r16				\n"
"	sts ucmb_buf_ptr + 1, r17				\n"
"	cpi r17, 0						\n"
"	brne 1f							\n"
"	cpi r16, %[sizeof_msg_hdr]				\n"
"	breq hdr_sanity_check ; buf_ptr == hdrlen		\n"
"	brlo st_listen_out    ; buf_ptr < hdrlen		\n"
"1:								\n"
"	; Get payload length from header			\n"
"	lds r30, (ucmb_buf + %[offsetof_hdr_len] + 0)		\n"
"	lds r31, (ucmb_buf + %[offsetof_hdr_len] + 1)		\n"
"	; Add header and footer length to get full length	\n"
"	subi r30, lo8(-(%[sizeof_msg_hdr] + %[sizeof_msg_footer]))	\n"
"	sbci r31, hi8(-(%[sizeof_msg_hdr] + %[sizeof_msg_footer]))	\n"
"	; Check if we have the full packet			\n"
"	cp r30, r16						\n"
"	cpc r31, r17						\n"
"	breq st_listen_have_full_packet				\n"
"st_listen_out:							\n"
"	pop r18							\n"
"	pop r17							\n"
"	pop r16							\n"
UCMB_IRQ_EPILOGUE /* reti */
"								\n"
"hdr_sanity_check:						\n"
"	lds r30, (ucmb_buf + %[offsetof_hdr_magic] + 0)		\n"
"	lds r31, (ucmb_buf + %[offsetof_hdr_magic] + 1)		\n"
"	ldi r18, hi8(%[_UCMB_MAGIC])				\n"
"	cpi r30, lo8(%[_UCMB_MAGIC])				\n"
"	cpc r31, r18						\n"
"	brne invalid_hdr_magic					\n"
"	lds r30, (ucmb_buf + %[offsetof_hdr_len] + 0)		\n"
"	lds r31, (ucmb_buf + %[offsetof_hdr_len] + 1)		\n"
"	ldi r18, hi8(0x8001)					\n"
"	cpi r30, lo8(0x8001)					\n"
"	cpc r31, r18						\n"
"	brsh bogus_payload_len					\n"
"	rjmp st_listen_out					\n"
"								\n"
"invalid_hdr_magic:						\n"
"	; Invalid magic number in the packet header. Reset.	\n"
"bogus_payload_len:						\n"
"	; Bogus payload length in packet header. Reset.		\n"
"	clr r18							\n"
"	sts ucmb_buf_ptr + 0, r18				\n"
"	sts ucmb_buf_ptr + 1, r18				\n"
"	rjmp st_listen_out					\n"
"								\n"
"st_listen_have_full_packet:					\n"
"	; We have the full packet. Any SPI transfer is stopped	\n"
"	; while we are processing the packet, so this		\n"
"	; is a slowpath.					\n"
"	; Disable SPI and pass control to ucmb_work to		\n"
"	; handle the message.					\n"
"	cbi %[_SPCR], %[_SPIE]					\n"
"	ldi r18, 1						\n"
"	sts ucmb_received_message, r18				\n"
"	rjmp st_listen_out					\n"
	: /* none */
	: [sizeof_buf]		"i" (sizeof(ucmb_buf))
	, [sizeof_msg_hdr]	"M" (sizeof(struct ucmb_message_hdr))
	, [sizeof_msg_footer]	"M" (sizeof(struct ucmb_message_footer))
	, [offsetof_hdr_magic]	"M" (offsetof(struct ucmb_message_hdr, magic))
	, [offsetof_hdr_len]	"M" (offsetof(struct ucmb_message_hdr, len))
	, [_SPDR]		"M" (_SFR_IO_ADDR(SPDR))
	, [_SPCR]		"M" (_SFR_IO_ADDR(SPCR))
	, [_SPIE]		"i" (SPIE)
	, [_UCMB_MAGIC]		"i" (UCMB_MAGIC)
	: "memory"
	);
}

static void __naked __used ucmb_handler_SENDSTATUS(void)
{
	__asm__ __volatile__(
"	push r16						\n"
/*"	push r17						\n" */
"	push r18						\n"
"	lds r16, ucmb_buf_ptr + 0				\n"
"	cpi r16, %[sizeof_ucmb_status]				\n"
"	brsh 1f ; This is the trailing byte			\n"
"	; Write the next byte from status_buf to SPDR		\n"
"	mov r30, r16						\n"
"	clr r31							\n"
"	subi r30, lo8(-(status_buf))				\n"
"	sbci r31, hi8(-(status_buf))				\n"
"	ld r18, Z						\n"
"	out %[_SPDR], r18					\n"
"1:								\n"
"	subi r16, lo8(-1)					\n"
"	sts ucmb_buf_ptr + 0, r16				\n"
"	cpi r16, (%[sizeof_ucmb_status] + 1)			\n"
"	brne st_sendstatus_out					\n"
"	; Finished. Sent all status_buf bytes + trailing byte.	\n"
"	clr r18							\n"
"	sts ucmb_buf_ptr + 0, r18				\n"
"	; Switch back to listening state...			\n"
"	ldi r18, lo8(gs(ucmb_handler_LISTEN))			\n"
"	sts ucmb_interrupt_handler + 0, r18			\n"
"	ldi r18, hi8(gs(ucmb_handler_LISTEN))			\n"
"	sts ucmb_interrupt_handler + 1, r18			\n"
"	; ...if we have no pending transmission			\n"
"	lds r30, ucmb_send_message_len + 0			\n"
"	lds r31, ucmb_send_message_len + 1			\n"
"	clr r18							\n"
"	cpi r30, 0						\n"
"	cpc r31, r18						\n"
"	breq st_sendstatus_out					\n"
"	; Switch status to SENDMESSAGE and send the first byte.	\n"
"	ldi r18, lo8(gs(ucmb_handler_SENDMESSAGE))		\n"
"	sts ucmb_interrupt_handler + 0, r18			\n"
"	ldi r18, hi8(gs(ucmb_handler_SENDMESSAGE))		\n"
"	sts ucmb_interrupt_handler + 1, r18			\n"
"	; Send the first byte					\n"
"	lds r18, ucmb_buf + 0					\n"
"	out %[_SPDR], r18					\n"
"	ldi r18, 1						\n"
"	sts ucmb_buf_ptr + 0, r18				\n"
"st_sendstatus_out:						\n"
"	pop r18							\n"
/*"	pop r17							\n"*/
"	pop r16							\n"
UCMB_IRQ_EPILOGUE /* reti */
	: /* none */
	: [sizeof_ucmb_status]	"M" (sizeof(struct ucmb_status))
	, [_SPDR]		"M" (_SFR_IO_ADDR(SPDR))
	: "memory"
	);
}

static void __naked __used ucmb_handler_SENDMESSAGE(void)
{
	__asm__ __volatile__(
"	push r16						\n"
"	push r17						\n"
"	push r18						\n"
"	lds r16, ucmb_buf_ptr + 0				\n"
"	lds r17, ucmb_buf_ptr + 1				\n"
"	lds r30, ucmb_send_message_len + 0			\n"
"	lds r31, ucmb_send_message_len + 1			\n"
"	cp r16, r30						\n"
"	cpc r17, r31						\n"
"	brsh 1f ; This is the trailing byte			\n"
"	movw r30, r16						\n"
"	subi r30, lo8(-(ucmb_buf))				\n"
"	sbci r31, hi8(-(ucmb_buf))				\n"
"	ld r18, Z						\n"
"	out %[_SPDR], r18					\n"
"1:								\n"
"	subi r16, lo8(-1)					\n"
"	sbci r17, hi8(-1)					\n"
"	sts ucmb_buf_ptr + 0, r16				\n"
"	sts ucmb_buf_ptr + 1, r17				\n"
"	lds r30, ucmb_send_message_len + 0			\n"
"	lds r31, ucmb_send_message_len + 1			\n"
"	subi r30, lo8(-1)					\n"
"	sbci r31, hi8(-1)					\n"
"	cp r16, r30						\n"
"	cpc r17, r31						\n"
"	brne st_sendmessage_out					\n"
"	; Message + trailing byte processed. Retrieve status.	\n"
"	clr r18							\n"
"	sts ucmb_buf_ptr + 0, r18				\n"
"	sts ucmb_buf_ptr + 1, r18				\n"
"	ldi r18, lo8(gs(ucmb_handler_RETRSTATUS))		\n"
"	sts ucmb_interrupt_handler + 0, r18			\n"
"	ldi r18, hi8(gs(ucmb_handler_RETRSTATUS))		\n"
"	sts ucmb_interrupt_handler + 1, r18			\n"
"st_sendmessage_out:						\n"
"	pop r18							\n"
"	pop r17							\n"
"	pop r16							\n"
UCMB_IRQ_EPILOGUE /* reti */
	: /* none */
	: [_SPDR]		"M" (_SFR_IO_ADDR(SPDR))
	: "memory"
	);
}

static void __naked __used ucmb_handler_RETRSTATUS(void)
{
	__asm__ __volatile__(
"	push r16						\n"
/*"	push r17						\n"*/
"	push r18						\n"
"	in r18, %[_SPDR]					\n"
"	lds r16, ucmb_buf_ptr + 0				\n"
"	mov r30, r16						\n"
"	clr r31							\n"
"	subi r30, lo8(-(status_buf))				\n"
"	sbci r31, hi8(-(status_buf))				\n"
"	st Z, r18						\n"
"	subi r16, -1						\n"
"	sts ucmb_buf_ptr + 0, r16				\n"
"	cpi r16, %[sizeof_ucmb_status]				\n"
"	brne st_retrstatus_out					\n"
"	; Completely received the status			\n"
"	clr r16							\n"
"	sts ucmb_buf_ptr + 0, r16				\n"
"	; Switch back to listening state...			\n"
"	ldi r18, lo8(gs(ucmb_handler_LISTEN))			\n"
"	sts ucmb_interrupt_handler + 0, r18			\n"
"	ldi r18, hi8(gs(ucmb_handler_LISTEN))			\n"
"	sts ucmb_interrupt_handler + 1, r18			\n"
"	; Check status-report magic value			\n"
"	lds r30, (status_buf + %[offsetof_status_magic] + 0)	\n"
"	lds r31, (status_buf + %[offsetof_status_magic] + 1)	\n"
"	ldi r18, hi8(%[_UCMB_MAGIC])				\n"
"	cpi r30, lo8(%[_UCMB_MAGIC])				\n"
"	cpc r31, r18						\n"
"	brne invalid_status_magic				\n"
"	; Check status-report error code			\n"
"	lds r30, (status_buf + %[offsetof_status_code] + 0)	\n"
"	lds r31, (status_buf + %[offsetof_status_code] + 1)	\n"
"	ldi r18, hi8(%[_UCMB_STAT_OK])				\n"
"	cpi r30, lo8(%[_UCMB_STAT_OK])				\n"
"	cpc r31, r18						\n"
"	brne faulty_status_code					\n"
"st_retrstatus_out:						\n"
"	pop r18							\n"
/*"	pop r17							\n"*/
"	pop r16							\n"
UCMB_IRQ_EPILOGUE /* reti */
"								\n"
"invalid_status_magic:						\n"
"faulty_status_code:						\n"
"	; Branch to the C error handler				\n"
"	; The handler does not return, so we don't need to	\n"
"	; push/pop the registers.				\n"
"	clr __zero_reg__					\n"
"	rjmp ucmb_received_faulty_status			\n"
	: /* none */
	: [sizeof_ucmb_status]		"M" (sizeof(struct ucmb_status))
	, [offsetof_status_magic]	"M" (offsetof(struct ucmb_status, magic))
	, [offsetof_status_code]	"M" (offsetof(struct ucmb_status, code))
	, [_SPDR]			"M" (_SFR_IO_ADDR(SPDR))
	, [_UCMB_MAGIC]			"i" (UCMB_MAGIC)
	, [_UCMB_STAT_OK]		"i" (UCMB_STAT_OK)
	: "memory"
	);
}

/* We received a status report with an error condition.
 * This is called from assembly code. The function does not return. */
static void __used __noret ucmb_received_faulty_status(void)
{
	/* The master sent us a status report with an error code.
	 * Something's wrong with us. Print a status message and
	 * get caught by the watchdog, yummy.
	 */

	cli();
	wdt_disable();
	wdt_enable(WDTO_15MS);
	ucmb_errorlog("UCMB: Received faulty status report. Triggering reset.");
	while (1) {
		/* "It's Coming Right For Us!" */
	}
}

void ucmb_work(void)
{
	struct ucmb_message_hdr *hdr;
	struct ucmb_message_footer *footer;
	uint16_t payload_len;

	if (!ucmb_received_message)
		return;

	hdr = (struct ucmb_message_hdr *)ucmb_buf;
	payload_len = hdr->len;

	status_buf.magic = UCMB_MAGIC;
	status_buf.code = UCMB_STAT_OK;
	if (unlikely(ucmb_buf_ptr > sizeof(ucmb_buf))) {
		/* Message is way too big and was truncated. */
		status_buf.code = UCMB_STAT_E2BIG;
	} else {
		footer = (struct ucmb_message_footer *)(
				ucmb_buf + sizeof(struct ucmb_message_hdr) +
				payload_len);
		if (ucmb_calc_msg_buffer_crc() != footer->crc)
			status_buf.code = UCMB_STAT_ECRC;
	}
	ucmb_interrupt_handler = ucmb_handler_SENDSTATUS;
	ucmb_buf_ptr = 0;
	/* Send the first byte */
	SPDR = ((uint8_t *)&status_buf)[ucmb_buf_ptr];
	ucmb_buf_ptr++;

	if (unlikely(status_buf.code != UCMB_STAT_OK))
		goto out; /* Corrupt message. Don't pass it to user code. */

	ucmb_send_message_len = ucmb_rx_message(
			ucmb_buf + sizeof(struct ucmb_message_hdr),
			payload_len);
	if (ucmb_send_message_len) {
		footer = (struct ucmb_message_footer *)(
				ucmb_buf + sizeof(struct ucmb_message_hdr) +
				ucmb_send_message_len);

		hdr->magic = UCMB_MAGIC;
		hdr->len = ucmb_send_message_len;
		footer->crc = ucmb_calc_msg_buffer_crc();

		ucmb_send_message_len += sizeof(struct ucmb_message_hdr) +
					 sizeof(struct ucmb_message_footer);
	}

out:
	ucmb_received_message = 0;
	mb();
	/* Re-enable SPI */
	SPCR |= (1 << SPIE);
}

void ucmb_init(void)
{
	ucmb_interrupt_handler = ucmb_handler_LISTEN;

	/* SPI slave mode 0 with IRQ enabled. */
	DDRB |= (1 << 6/*MISO*/);
	DDRB &= ~((1 << 7/*SCK*/) | (1 << 5/*MOSI*/) | (1 << 4/*SS*/));
	SPCR = (1 << SPE) | (1 << SPIE) /*| (1 << CPOL) | (1 << CPHA)*/;
	(void)SPSR; /* clear state */
	(void)SPDR; /* clear state */
}
