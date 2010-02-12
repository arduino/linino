#include "remotectrl.h"

int main(){
	time_t tim;
	struct rmt_socket_t srv;
	struct rmt_socket_t client[MAX_CLIENTS];
	int activeClients = 0;			/* Número clientes conectados */
	
	srv = initSrv();
	
//	client = initClients();
	

	while (1){
		tim=time(NULL);
		printf("%s", ctime(&tim) );
		rmtctrl_srv(srv,client,&activeClients);
		usleep (100);
	}
	return 0;
}

