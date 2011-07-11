/*
 *   Microcontroller message bus
 *   uc-side slave implementation for Atmel AVR8
 *
 *   The gcc compiler always treats multi-byte variables as litte-endian.
 *   So no explicit endianness conversions are done on the message header,
 *   footer and status data structures.
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
#include <util/crc16.h>


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
			sizeof(struct ucmb_message_footer)];
static uint16_t ucmb_buf_ptr;
static struct ucmb_status status_buf;
static uint16_t ucmb_send_message_len;

/* Statemachine */
static uint8_t ucmb_state;
enum {
	UCMB_ST_LISTEN,		/* Listen for incoming messages. */
	UCMB_ST_SENDSTATUS,	/* Send the status report. */
	UCMB_ST_SENDMESSAGE,	/* Send the message. */
	UCMB_ST_RETRSTATUS,	/* Retrieve the status report. */
};

#define TRAILING	1


static void ucmb_send_next_byte(void)
{
	switch (ucmb_state) {
	case UCMB_ST_SENDSTATUS: {
		const uint8_t *st = (const uint8_t *)&status_buf;

		if (ucmb_buf_ptr < sizeof(struct ucmb_status))
			SPDR = st[ucmb_buf_ptr];
		ucmb_buf_ptr++;
		if (ucmb_buf_ptr == sizeof(struct ucmb_status) + TRAILING) {
			ucmb_buf_ptr = 0;
			if (ucmb_send_message_len) {
				ucmb_state = UCMB_ST_SENDMESSAGE;
				goto st_sendmessage;
			} else
				ucmb_state = UCMB_ST_LISTEN;
		}
		break;
	}
	case UCMB_ST_SENDMESSAGE: {
  st_sendmessage:;
		uint16_t full_length = sizeof(struct ucmb_message_hdr) +
				       ucmb_send_message_len +
				       sizeof(struct ucmb_message_footer);
		if (ucmb_buf_ptr < full_length)
			SPDR = ucmb_buf[ucmb_buf_ptr];
		ucmb_buf_ptr++;
		if (ucmb_buf_ptr == full_length + TRAILING) {
			ucmb_send_message_len = 0;
			ucmb_buf_ptr = 0;
			ucmb_state = UCMB_ST_RETRSTATUS;
		}
		break;
	} }
}

static uint16_t crc16_block_update(uint16_t crc, const void *_data, uint16_t size)
{
	const uint8_t *data = _data;

	while (size) {
		crc = _crc16_update(crc, *data);
		data++;
		size--;
	}

	return crc;
}

static uint16_t ucmb_calc_msg_buffer_crc(void)
{
	const struct ucmb_message_hdr *hdr;
	uint16_t crc = 0xFFFF;

	hdr = (const struct ucmb_message_hdr *)ucmb_buf;
	crc = crc16_block_update(crc, ucmb_buf,
				 sizeof(struct ucmb_message_hdr) + hdr->len);
	crc ^= 0xFFFF;

	return crc;
}

/* SPI data transfer interrupt. */
ISR(SPI_STC_vect)
{
	uint8_t data;

	data = SPDR;
	SPDR = 0;

	switch (ucmb_state) {
	case UCMB_ST_LISTEN: {
		struct ucmb_message_hdr *hdr;
		struct ucmb_message_footer *footer;

		if (ucmb_buf_ptr < sizeof(ucmb_buf))
			ucmb_buf[ucmb_buf_ptr] = data;
		ucmb_buf_ptr++;
		if (ucmb_buf_ptr < sizeof(struct ucmb_message_hdr))
			return; /* Header RX not complete. */
		hdr = (struct ucmb_message_hdr *)ucmb_buf;
		if (ucmb_buf_ptr == sizeof(struct ucmb_message_hdr)) {
			if (hdr->magic != UCMB_MAGIC) {
				/* Invalid magic! Reset. */
				ucmb_buf_ptr = 0;
				return;
			}
			if (hdr->len > 0x8000) {
				/* Completely bogus length! Reset. */
				ucmb_buf_ptr = 0;
				return;
			}
			return;
		}

		if (ucmb_buf_ptr == sizeof(struct ucmb_message_hdr) +
				    sizeof(struct ucmb_message_footer) +
				    hdr->len) {
			status_buf.magic = UCMB_MAGIC;
			status_buf.code = UCMB_STAT_OK;
			if (ucmb_buf_ptr > sizeof(ucmb_buf)) {
				/* Message is way too big and was truncated. */
				status_buf.code = UCMB_STAT_E2BIG;
			} else {
				footer = (struct ucmb_message_footer *)(
						ucmb_buf + sizeof(struct ucmb_message_hdr) +
						hdr->len);
				if (ucmb_calc_msg_buffer_crc() != footer->crc)
					status_buf.code = UCMB_STAT_ECRC;
			}
			ucmb_state = UCMB_ST_SENDSTATUS;
			ucmb_buf_ptr = 0;
			ucmb_send_next_byte();

			if (status_buf.code != UCMB_STAT_OK)
				return; /* Corrupt message. Don't pass it to user code. */

			ucmb_send_message_len = ucmb_rx_message(
					ucmb_buf + sizeof(struct ucmb_message_hdr),
					hdr->len);
			if (ucmb_send_message_len) {
				footer = (struct ucmb_message_footer *)(
						ucmb_buf + sizeof(struct ucmb_message_hdr) +
						ucmb_send_message_len);

				hdr->magic = UCMB_MAGIC;
				hdr->len = ucmb_send_message_len;
				footer->crc = ucmb_calc_msg_buffer_crc();
			}
		}
		break;
	}
	case UCMB_ST_SENDSTATUS:
	case UCMB_ST_SENDMESSAGE:
		ucmb_send_next_byte();
		break;
	case UCMB_ST_RETRSTATUS: {
		uint8_t *st = (uint8_t *)&status_buf;

		st[ucmb_buf_ptr++] = data;
		if (ucmb_buf_ptr == sizeof(struct ucmb_status)) {
			/* We could possibly handle the status report here... */
			ucmb_buf_ptr = 0;
			ucmb_state = UCMB_ST_LISTEN;
		}
		break;
	} }
}

void ucmb_init(void)
{
	ucmb_state = UCMB_ST_LISTEN;

	/* SPI slave mode 0 with IRQ enabled. */
	DDRB |= (1 << 4/*MISO*/);
	DDRB &= ~((1 << 5/*SCK*/) | (1 << 3/*MOSI*/) | (1 << 2/*SS*/));
	SPCR = (1 << SPE) | (1 << SPIE) /*| (1 << CPOL) | (1 << CPHA)*/;
	(void)SPSR; /* clear state */
	(void)SPDR; /* clear state */
}
