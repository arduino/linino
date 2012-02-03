#ifndef UCMB_AVR8_H_
#define UCMB_AVR8_H_

#include <stdint.h>


/* Max length of the message payload. */
#define UCMB_MAX_MSG_LEN	0x200

/* ucmb_rx_message - Message receive callback.
 * Define this elsewhere. It's called on successful retrieval
 * of a new message.
 * If a reply message has to be transferred after this one, put the
 * message payload into the "payload" buffer and return the number
 * of bytes to transmit. If no reply message is needed, return 0.
 * Note that the "payload" buffer always has a size of UCMB_MAX_MSG_LEN.
 */
extern uint16_t ucmb_rx_message(uint8_t *payload,
				uint16_t payload_length);

/* Initialize the UCMB subsystem. */
void ucmb_init(void);

#endif /* UCMB_AVR8_H_ */
