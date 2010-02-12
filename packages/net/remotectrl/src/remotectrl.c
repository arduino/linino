#include "remotectrl.h"

int write_msg( struct rmt_socket_t *sckHnd, uint32_t id, uint32_t extra, char *message ){
	msg_head_t header;
	int rslt;
	header.id    = id;
	header.len   = strlen(message);
	header.extra = extra;
  rslt = send(sckHnd->fd,&header,sizeof(struct msg_head_t),0);
	if (rslt != -1 && header.len > 0) {
		sckHnd->Tx += rslt;
		rslt = send(sckHnd->fd, message, header.len, 0);
		if (rslt > 0)
		{
			sckHnd->Tx += rslt;
			rslt += sizeof(struct msg_head_t);
		}
	}
	return rslt;
}

int read_msg( struct rmt_socket_t *sckHnd, msg_head_t *head, char **message )
{
	msg_head_t header;
	int rslt;
	char *buffer;
	int reading = 0;
	int aux = 0;
  rslt = recv(sckHnd->fd, head, sizeof(struct msg_head_t), 0);
//	printf("head->id=%d head->extra=%d head->len=%d\n",head->id,head->extra,head->len);
	if (rslt == sizeof(struct msg_head_t) ) {
		sckHnd->Rx += rslt;
		buffer = malloc(head->len+1);
		while ( reading < head->len ){
			memset(buffer,'\0', head->len+1);
			aux = recv(sckHnd->fd, buffer, head->len, 0);
			switch ( aux ) {
				case -1:
					switch (errno){
						case EINTR:
						case EAGAIN:
							usleep (100);
							break;
						default:
							return -1;
					}
				break;
				case 0: // mean socket was closed
					sckHnd->Rx += reading;
					return reading;
					break;
				break;
				default:
					if (reading == 0) 
						*message=malloc(aux+1);
					else
						*message=(char*)realloc(*message,(reading+aux+1)*sizeof(char));
					memcpy(*message+reading, buffer, aux);
					reading += aux;	
			}
		}
		free(buffer);
		sckHnd->Rx += reading;
		reading += rslt;
		return reading;
	}
	return rslt;
}

void rmtctrl_srv(struct rmt_socket_t srv, struct rmt_socket_t *client, int *activeClients)
{
	fd_set fdRead;
	int maxHnd;
	int i;
	struct timeval  nowait; 
	memset((char *)&nowait,0,sizeof(nowait)); 

	rmtctrl_cleanClients(client, activeClients);
	FD_ZERO (&fdRead);
	FD_SET (srv.fd, &fdRead);

	for (i=0; i<*activeClients; i++)
		FD_SET (client[i].fd, &fdRead);

	maxHnd = rmtctrl_maxValue (client, *activeClients);
		
	if (maxHnd < srv.fd)
		maxHnd = srv.fd;

	select (maxHnd + 1, &fdRead, NULL, NULL,&nowait);
	for (i=0; i<*activeClients; i++)
	{
		if (FD_ISSET (client[i].fd, &fdRead))
		{
				rmtctrl_msg_proccess(&client[i]);
		}
	}
	if (FD_ISSET (srv.fd, &fdRead))
		rmtctrl_newClient(srv,client, &(*activeClients));
}

void rmtctrl_msg_proccess(struct rmt_socket_t *client)
{
	msg_head_t header;
	char *msg=NULL;
	int rslt;
	rslt = read_msg(client,&header,&msg);
	if (rslt > 0)
	{
		switch (header.id)
		{
			case QRY_STATUS:
				rslt = write_msg(client,MSG_END,0, "Bienvenido a mi servidor.\nStatus\n" );
			break;
			case QRY_CONNECTED_LIST:
				rslt = write_msg(client,MSG_START,0, "List of Connected\n" );
				rslt = write_msg(client,MSG_PART,0, "Username       IPAddrs         Status\n" );
				rslt = write_msg(client,MSG_PART,0, "pepe1          198.164.234.224 Authenticated\n" );
				rslt = write_msg(client,MSG_PART,0, "pepe2          198.164.234.220 Authenticated\n" );
				rslt = write_msg(client,MSG_PART,0, "pepe3          198.164.234.221 Authenticated\n" );
				rslt = write_msg(client,MSG_PART,0, "pepe4          198.164.234.223 Authenticated\n" );
				rslt = write_msg(client,MSG_PART,0, "pepe5          198.164.234.227 Authenticated\n" );
				rslt = write_msg(client,MSG_END,0, "pepe6          198.164.234.224 Authenticated\n" );
			break;
			default:
				rslt = write_msg(client,MSG_END,9, "Unknow command.\n" );
		}
	}
	else
	{
		printf("Desde %s se recibieron %d bytes y se enviaron %d bytes\n",inet_ntoa(client->addr.sin_addr),client->Rx,client->Tx);
		close(client->fd); /* cierra fd_rmt_client */
		printf("Client cerro conexión desde %s\n",inet_ntoa(client->addr.sin_addr) ); 
		client->fd = -1;
	}
	if ( msg != NULL) free(msg);
}

void rmtctrl_newClient(struct rmt_socket_t srv, struct rmt_socket_t *client, int *activeClients)
{
	int rslt;
	int cli = (*activeClients);
	rmtctrl_accept(srv,&client[cli]);
	if (client[(*activeClients)].fd != -1)
	{
		(*activeClients)++;
	}
	if ((*activeClients) >= MAX_CLIENTS)
	{
		(*activeClients)--;
		rslt = write_msg(&client[(*activeClients)],MSG_END,0, "Sorry Server is too Busy\n	Try more late\n" );
		if (rslt > 0) client[(*activeClients)].Tx += rslt;
		rmtctrl_close(&client[(*activeClients)]);
	}
}

void rmtctrl_close ( struct rmt_socket_t *client )
{
	printf("Desde %s se recibieron %d bytes y se enviaron %d bytes\n",inet_ntoa(client->addr.sin_addr),client->Rx,client->Tx);
	close(client->fd); /* cierra fd_rmt_client */
	printf("Se cerro conexión desde %s\n",inet_ntoa(client->addr.sin_addr) ); 
	client->fd = -1;
}

void rmtctrl_accept (struct rmt_socket_t srv, struct rmt_socket_t *client ) 
{
	int sin_size=sizeof(struct sockaddr_in);
	int int_Send;
	struct sockaddr_in addr;
	
	if ((client->fd = accept(srv.fd,(struct sockaddr *)&client->addr,&sin_size))!=-1) 
	{
		client->Rx = 0;
		client->Tx = 0;
		unsigned char c = sizeof(uint32_t);
		int_Send = send(client->fd, &c, 1, 0);
		if (int_Send > 0) client->Tx += int_Send;
		printf("Se abrió una conexión desde %s\n", inet_ntoa(client->addr.sin_addr)); 
	}
}

struct rmt_socket_t initSrv(){
	struct rmt_socket_t srv;
	if ((srv.fd=socket(AF_INET, SOCK_STREAM, 0)) == -1 ) {  
		printf("error en socket()\n");
		exit(-1);
	}
	srv.addr.sin_family = AF_INET;
	srv.addr.sin_port = htons(PORT); 
	srv.addr.sin_addr.s_addr = INADDR_ANY; 
	bzero(&(srv.addr.sin_zero),8); 

	if(bind(srv.fd,(struct sockaddr*)&srv.addr,sizeof(struct sockaddr))==-1) {
		printf("error en bind() \n");
		exit(-1);
	}     

	if(listen(srv.fd,BACKLOG) == -1) {
		printf("error en listen()\n");
		exit(-1);
	}
	return srv;
}

//void cleanClients (int *table, int *n)
void rmtctrl_cleanClients (struct rmt_socket_t *client, int *n)
{
	int i,j;

	if ((client == NULL) || ((*n) == 0))
		return;

	j=0;
	for (i=0; i<(*n); i++)
	{
		if (client[i].fd != -1)
		{
			client[j].fd = client[i].fd;
			client[j].addr = client[i].addr;
			client[j].Rx = client[i].Rx;
			client[j].Tx = client[i].Tx;
			j++;
		}
	}
	
	*n = j;
}

int rmtctrl_maxValue (struct rmt_socket_t *client, int n)
{
	int i;
	int max;

	if ((client == NULL) || (n<1))
		return 0;
		
	max = client[0].fd;
	for (i=0; i<n; i++)
		if (client[i].fd > max)
			max = client[i].fd;

	return max;
}


/*
void main()
{
	rmtctrl_srv();
}
*/
