/*
* Javier Abellan, 20 Jun 2000
*
* Funciones de lectura y escritura en sockets
*
* MODIFICACIONES:
* 4 Septiembre 2003: Añadidas funciones para sockets UDP.
*/
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h> 
#include <sys/un.h>
#include <netdb.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>

#include "Socket.h"

#define BUFFER_SIZE 13

int ReadTcpSocket (int fd, char **Datos)
{
	int Leido = 0;
	struct head_t *head;
	int Aux=0;
	char buffer[BUFFER_SIZE];
	char *message;
	message = malloc(BUFFER_SIZE);
	while (1){
		bzero(buffer, BUFFER_SIZE);
		Aux = read(fd, buffer, BUFFER_SIZE-1);
		if (Leido==0){
			message = memcpy(message, buffer, Aux);
			head = malloc(sizeof(struct head_t));
			head = memcpy(head,buffer,Aux);
		} else {
			message = realloc(message,(strlen(message)+Aux));
			if (Aux == BUFFER_SIZE-1)
				message = strcat(message,buffer);
			else
				message = strncat(message,buffer,Aux);
		}
		Leido += Aux;

printf("msg=%s Leido=%d\n", message, Leido); 
		if (Aux < BUFFER_SIZE-1 || Leido == head->len )
			break;
	}
	*Datos=realloc(*Datos,Leido+1);
	memcpy(*Datos,head,sizeof(struct head_t));
	memcpy(*Datos+12, message, Leido);
	return Leido;
}

int WriteTcpSocket(int fd, int type, int command, char *data){
	int Escrito = 0;
	int Aux = 0;

	int Longitud = (sizeof(int)*3)+strlen((char *)data);
	struct s_msg *Datos;
	Datos = malloc(Longitud);
	Datos->type = type;
	Datos->command = command;
	Datos->len = Longitud;
	strcpy(Datos->data, data);
	printf("Longitud=%d convertido Type=%d Command=%d Len=%d Data=%s\n",Longitud, Datos->type, Datos->command, Datos->len, Datos->data);
	printf("Longitud=%d int=%d\n", Longitud,sizeof(int));
/*
	if ((fd == -1) || (Datos == NULL) || (Longitud < 1))
		return -1;

*/
//printf("Data:%s", *Datos);
	while (Escrito < Longitud)
	{
		Aux = write (fd, Datos + Escrito, Longitud - Escrito);
		if (Aux > 0)
		{
		Escrito = Escrito + Aux;
		}
		else
		{
			if (Aux == 0)
				return Escrito;
			else
				return -1;
		}
	}
	free(Datos);
	return Escrito;
}

/*
* Lee datos del socket. Supone que se le pasa un buffer con hueco 
*	suficiente para los datos. Devuelve el numero de bytes leidos o
* 0 si se cierra fichero o -1 si hay error.
*/
int Lee_Socket1 (int fd, char *Datos, int Longitud)
{
	int Leido = 0;
	int Aux = 0;


	/*
	* Comprobacion de que los parametros de entrada son correctos
	*/
	if ((fd == -1) || (Datos == NULL) || (Longitud < 1))
		return -1;

	/*
	* Mientras no hayamos leido todos los datos solicitados
	*/

	while (Leido < Longitud)
	{
		Aux = read (fd, Datos + Leido, Longitud - Leido);
		if (Aux > 0)
		{
			/* 
			* Si hemos conseguido leer datos, incrementamos la variable
			* que contiene los datos leidos hasta el momento
			*/
			Leido = Leido + Aux;
		}
		else
		{
			/*
			* Si read devuelve 0, es que se ha cerrado el socket. Devolvemos
			* los caracteres leidos hasta ese momento
			*/
			if (Aux == 0) 
				return Leido;
			if (Aux == -1)
			{
				/*
				* En caso de error, la variable errno nos indica el tipo
				* de error. 
				* El error EINTR se produce si ha habido alguna
				* interrupcion del sistema antes de leer ningun dato. No
				* es un error realmente.
				* El error EGAIN significa que el socket no esta disponible
				* de momento, que lo intentemos dentro de un rato.
				* Ambos errores se tratan con una espera de 100 microsegundos
				* y se vuelve a intentar.
				* El resto de los posibles errores provocan que salgamos de 
				* la funcion con error.
				*/
				switch (errno)
				{
					case EINTR:
					case EAGAIN:
						usleep (100);
						break;
					default:
						return -1;
				}
			}
		}
	}

	/*
	* Se devuelve el total de los caracteres leidos
	*/
	return Leido;
}

/*
* Escribe dato en el socket cliente. Devuelve numero de bytes escritos,
* o -1 si hay error.
*/
int Escribe_Socket (int fd, char *Datos, int Longitud)
{
	int Escrito = 0;
	int Aux = 0;

	/*
	* Comprobacion de los parametros de entrada
	*/
	if ((fd == -1) || (Datos == NULL) || (Longitud < 1))
		return -1;

	/*
	* Bucle hasta que hayamos escrito todos los caracteres que nos han
	* indicado.
	*/
	while (Escrito < Longitud)
	{
		Aux = write (fd, Datos + Escrito, Longitud - Escrito);
		if (Aux > 0)
		{
			/*
			* Si hemos conseguido escribir caracteres, se actualiza la
			* variable Escrito
			*/
			Escrito = Escrito + Aux;
		}
		else
		{
			/*
			* Si se ha cerrado el socket, devolvemos el numero de caracteres
			* leidos.
			* Si ha habido error, devolvemos -1
			*/
			if (Aux == 0)
				return Escrito;
			else
				return -1;
		}
	}

	/*
	* Devolvemos el total de caracteres leidos
	*/
	return Escrito;
}

/**
 * Lee un mensaje de un socket udp. Los parámetros que se pasan son:
 * - Descriptor fd del socket del que se quiere leer.
 * - Estructura Remoto, en la que se devolverá los datos del que ha enviado el
 * mensaje que acabamos de leer.
 * - Longitud_Remoto de la estructura anterior. Debe pasarse relleno con el tamaño
 * de Remoto y se devolverá rellena con el tamaño de los datos en Remoto.
 * - Buffer de Datos donde se quiere que aparezca el mensaje.
 * - Longitud_Datos del buffer anterior.
 *
 * Devuelve el número de bytes leidos o -1 en caso de error.
 */
int Lee_Socket_Udp (
	int fd, struct sockaddr *Remoto, socklen_t *Longitud_Remoto,
	char *Datos, int Longitud_Datos)
{
	int Leido = 0;
	int Aux = 0;

	/*
	* Comprobacion de que los parametros de entrada son correctos
	*/
	if ((fd == -1) || (Datos == NULL) || (Longitud_Datos < 1)
			|| (Remoto == NULL) || (Longitud_Remoto == NULL))
	{
		return -1;
	}

	/*
	* Mientras no hayamos leido todos los datos solicitados
	*/
	while (Leido < Longitud_Datos)
	{
		Aux = recvfrom (fd, Datos + Leido, Longitud_Datos - Leido, 0,
			Remoto, Longitud_Remoto);

		if (Aux > 0)
		{
			/* 
			* Si hemos conseguido leer datos, incrementamos la variable
			* que contiene los datos leidos hasta el momento
			*/
			Leido = Leido + Aux;
		}
		else
		{
			/*
			* Si read devuelve 0, es que se ha cerrado el socket. Devolvemos
			* los caracteres leidos hasta ese momento
			*/
			if (Aux == 0) 
				return Leido;
			if (Aux == -1)
			{
				/*
				* En caso de error, la variable errno nos indica el tipo
				* de error. 
				* El error EINTR se produce si ha habido alguna
				* interrupcion del sistema antes de leer ningun dato. No
				* es un error realmente.
				* El error EGAIN significa que el socket no esta disponible
				* de momento, que lo intentemos dentro de un rato.
				* Ambos errores se tratan con una espera de 100 microsegundos
				* y se vuelve a intentar.
				* El resto de los posibles errores provocan que salgamos de 
				* la funcion con error.
				*/
				switch (errno)
				{
					case EINTR:
					case EAGAIN:
						usleep (100);
						break;
					default:
						return -1;
				}
			}
		}
	}

	/*
	* Se devuelve el total de los caracteres leidos
	*/
	return Leido;
}

/**
* Escribe dato en el socket cliente. Devuelve numero de bytes escritos,
* o -1 si hay error.
* - fd es el descriptor del socket.
* - Remoto es el destinatario del mensaje, a quién se lo queremos enviar. 
* - Longitud_Remoto es el tamaño de Remoto en bytes.
* - Datos es el mensaje que queremos enviar.
* - Longitud_Datos es el tamaño del mensaje en bytes.
*/
int Escribe_Socket_Udp (int fd, struct sockaddr *Remoto, 
	socklen_t Longitud_Remoto, char *Datos, int Longitud_Datos)
{
	int Escrito = 0;
	int Aux = 0;

	/*
	* Comprobacion de los parametros de entrada
	*/
	if ((fd == -1) || (Datos == NULL) || (Longitud_Datos < 1) 
			|| (Remoto == NULL) )
   {
		return -1;
   }

	/*
	* Bucle hasta que hayamos escrito todos los caracteres que nos han
	* indicado.
	*/
	while (Escrito < Longitud_Datos)
	{
		Aux = sendto (fd, Datos + Escrito, Longitud_Datos - Escrito, 0,
			Remoto, Longitud_Remoto);

		if (Aux > 0)
		{
			/*
			* Si hemos conseguido escribir caracteres, se actualiza la
			* variable Escrito
			*/
			Escrito = Escrito + Aux;
		}
		else
		{
			/*
			* Si se ha cerrado el socket, devolvemos el numero de caracteres
			* leidos.
			* Si ha habido error, devolvemos -1
			*/
			if (Aux == 0)
				return Escrito;
			else
         {
				return -1;
         }
		}
	}

	/*
	* Devolvemos el total de caracteres leidos
	*/
	return Escrito;
}


/**
 * Rellena una estructura sockaddr_in con los datos que se le pasan. Esta estrutura es
 * útil para el envio o recepción de mensajes por sockets Udp o para abrir conexiones.
 * Se le pasa el host. Puede ser NULL (para abrir socket servidor Udp o para recepción de
 * mensajes de cualquier host).
 * Se le pasa el servicio. Puede ser NULL (para abrir socket cliente Udp).
 * Se le pasa una estructura sockaddr_in que devolverá rellena.
 * Se le pasa una Longitud. Debe contener el tamaño de la estructura sockaddr_in y
 * devolverá el tamaño de la estructura una vez rellena.
 * Devuelve -1 en caso de error.
 */
int Dame_Direccion_Udp (char *Host, char *Servicio, struct sockaddr_in *Servidor,
   int *Longitud_Servidor)
{
   struct servent *Puerto;
   struct hostent *Maquina;
  
   /* Comprobación de parámetros */
   if (Servidor == NULL) return -1;

   /* Relleno del primer campo de la estructura */
   Servidor->sin_family = AF_INET;

   /* Si nos han pasado un host ... */
   if (Host != NULL)
   {
      /* ... obtenemos la dirección del host y la ponemos en la estructura */
      Maquina = gethostbyname (Host);
      if (Maquina == NULL)
         return -1;

      Servidor->sin_addr.s_addr = ((struct in_addr *)(Maquina->h_addr))->s_addr;
   }
   else
      /* Si no nos han pasado un host, ponemos cualquier host. */
      Servidor->sin_addr.s_addr = INADDR_ANY;

   /* Si servicio en NULL, hacemos que el puerto lo eliga el sistema operativo
    libremente.*/
   if (Servicio == NULL)
      Servidor->sin_port = 0;
   else
   {
      /* Si el servicio no es NULL, lo obtenemos. */
      Puerto = getservbyname (Servicio, "udp");
      if (Puerto == NULL)
         return -1;
      Servidor->sin_port = Puerto->s_port;
   }
}
