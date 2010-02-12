/* Estos son los ficheros de cabecera usuales */
#include <stdio.h>          
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>

#define PORT 15557 /* El puerto que ser? abierto */
#define BACKLOG 2 /* El n?mero de conexiones permitidas */
#define MAX_CLIENTS 10

enum 
{
	MSG_OK              = 0,
	MSG_START           = 1,
	MSG_PART            = 2,
	MSG_END             = 3,
	QRY_STATUS          = 100,
	QRY_CONNECTED_LIST  = 101,
	QRY_MACADDR         = 102,
	QRY_IPADDR          = 103,
	QRY_USERNAME        = 104,
};

typedef struct msg_head_t {
	uint32_t id;
	uint32_t extra;
	uint32_t len;
} msg_head_t;

typedef struct rmt_socket_t {
	int fd;
	struct sockaddr_in addr;
	int Rx;
	int Tx;
} rmt_socket_t;

	
int write_msg( struct rmt_socket_t *sckHnd, uint32_t id, uint32_t extra, char *message );
int read_msg( struct rmt_socket_t *sckHnd, msg_head_t *head, char **message );

struct rmt_socket_t initSrv();
void rmtctrl_srv(struct rmt_socket_t srv, struct rmt_socket_t *client, int *activeClients);

void rmtctrl_accept (struct rmt_socket_t srv, struct rmt_socket_t *client );
void rmtctrl_cleanClients (struct rmt_socket_t *client, int *n);
void rmtctrl_msg_proccess(struct rmt_socket_t *client);
void rmtctrl_newClient(struct rmt_socket_t srv, struct rmt_socket_t *client, int *activeClients);
void rmtctrl_close ( struct rmt_socket_t *client );
