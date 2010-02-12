/* Javier Abellán, 20 Junio 2000
 *
 * Funciones para abrir/establecer sockets de un cliente con un servidor.
 *
 * MODIFICACIONES:
 * 4 Septiembre 2003. Añadida función Abre_Conexion_Udp()
 */


/*
* Includes del sistema
*/
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

/*
* Conecta con un servidor Unix, en la misma maquina.
*	Devuelve descriptor de socket si todo es correcto, -1 si hay error.
*/
int Abre_Conexion_Unix (char *Servicio)
{
	struct sockaddr_un Direccion;
	int Descriptor;

	strcpy (Direccion.sun_path, Servicio);
	Direccion.sun_family = AF_UNIX;

	/* Se abre el descriptor del socket */
	Descriptor = socket (AF_UNIX, SOCK_STREAM, 0);
	if (Descriptor == -1)
		return -1;

	/* Se establece la conexion.
	 * Devuelve 0 si todo va bien, -1 en caso de error */
	if (connect (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			strlen (Direccion.sun_path) + sizeof (Direccion.sun_family)) == -1)
	{
		return -1;
	}

	return Descriptor;
}

/*
* Conecta con un servidor remoto a traves de socket INET
*/
int Abre_Conexion_Inet (
	char *Host_Servidor, 
	char *Servicio)
{
	struct sockaddr_in Direccion;
	struct servent *Puerto;
	struct hostent *Host;
	int Descriptor;

/*
	Puerto = getservbyname (Servicio, "tcp");
	Puerto = 15557;
	if (Puerto == NULL)
		return -1;
*/

	Host = gethostbyname (Host_Servidor);
	if (Host == NULL)
		return -1;

	Direccion.sin_family = AF_INET;
	Direccion.sin_addr.s_addr = ((struct in_addr *)(Host->h_addr))->s_addr;
//	Direccion.sin_port = Puerto->s_port;
	Direccion.sin_port = 15557;
	
	Descriptor = socket (AF_INET, SOCK_STREAM, 0);
	if (Descriptor == -1)
		return -1;

	if (connect (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			sizeof (Direccion)) == -1)
	{
		return -1;
	}

	return Descriptor;
}


/*
 * Prepara un socket para un cliente UDP.
 * Asocia un socket a un cliente UDP en un servicio cualquiera elegido por el sistema,
 * de forma que el cliente tenga un sitio por el que enviar y recibir mensajes.
 * Devuelve el descriptor del socket que debe usar o -1 si ha habido algún error.
 */
int Abre_Conexion_Udp ()
{
	struct sockaddr_in Direccion;
	int Descriptor;

	/* Se abre el socket UDP (DataGRAM) */
	Descriptor = socket (AF_INET, SOCK_DGRAM, 0);
	if (Descriptor == -1)
	{
		return -1;
	}

	/* Se rellena la estructura de datos necesaria para hacer el bind() */
	Direccion.sin_family = AF_INET;            /* Socket inet */
	Direccion.sin_addr.s_addr = htonl(INADDR_ANY);    /* Cualquier dirección IP */
	Direccion.sin_port = htons(0);                    /* Dejamos que linux eliga el servicio */

	/* Se hace el bind() */
	if (bind (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			sizeof (Direccion)) == -1)
	{
		close (Descriptor);
		return -1;
	}

	/* Se devuelve el Descriptor */
	return Descriptor;
}
