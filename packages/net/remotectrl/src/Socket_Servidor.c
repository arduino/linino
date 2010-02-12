/*
* Javier Abellan, 20 Jun 2000
*
* Funciones para la apertura de un socket servidor y la conexion con sus
* clientes
*
* MODIFICACIONES:
* 4 Septiembre 2003: Añadida función Abre_Socket_Udp() 
*/

/* Includes del sistema */
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>
#include <unistd.h>
#include <errno.h>

/*
*	Abre socket servidor UNIX. Se le pasa el servicio que se desea atender. 
* Deja el socket preparado
* para aceptar conexiones de clientes.
* Devuelve el descritor del socket servidor, que se debera pasar
* a la funcion Acepta_Conexion_Cliente(). Devuelve -1 en caso de error
*/
int Abre_Socket_Unix (char *Servicio)
{
	struct sockaddr_un Direccion;
	int Descriptor;

	/*
	* Se abre el socket
	*/
	Descriptor = socket (AF_UNIX, SOCK_STREAM, 0);
	if (Descriptor == -1)
	 	return -1;

	/*
	* Se rellenan en la estructura Direccion los datos necesarios para
	* poder llamar a la funcion bind()
	*/
	strcpy (Direccion.sun_path, Servicio);
	Direccion.sun_family = AF_UNIX;

	if (bind (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			strlen (Direccion.sun_path) + sizeof (Direccion.sun_family)) == -1)
	{
		/*
		* En caso de error cerramos el socket y devolvemos error
		*/
		close (Descriptor);
		return -1;
	}

	/*
	* Avisamos al sistema que comience a atender peticiones de clientes.
	*/
	if (listen (Descriptor, 1) == -1)
	{
		close (Descriptor);
		return -1;
	}

	/*
	* Se devuelve el descriptor del socket servidor
	*/
	return Descriptor;
}

/*
* Se le pasa un socket de servidor y acepta en el una conexion de cliente.
* devuelve el descriptor del socket del cliente o -1 si hay problemas.
* Esta funcion vale para socket AF_INET o AF_UNIX.
*/
int Acepta_Conexion_Cliente (int Descriptor)
{
	socklen_t Longitud_Cliente;
	struct sockaddr Cliente;
	int Hijo;

	/*
	* La llamada a la funcion accept requiere que el parametro 
	* Longitud_Cliente contenga inicialmente el tamano de la
	* estructura Cliente que se le pase. A la vuelta de la
	* funcion, esta variable contiene la longitud de la informacion
	* util devuelta en Cliente
	*/
	Longitud_Cliente = sizeof (Cliente);
	Hijo = accept (Descriptor, &Cliente, &Longitud_Cliente);
	if (Hijo == -1)
		return -1;

	/*
	* Se devuelve el descriptor en el que esta "enchufado" el cliente.
	*/
	return Hijo;
}

/*
* Abre un socket servidor de tipo AF_INET. Devuelve el descriptor
*	del socket o -1 si hay probleamas
* Se pasa como parametro el nombre del servicio. Debe estar dado
* de alta en el fichero /etc/services
*/
int Abre_Socket_Inet (char *Servicio)
{
	struct sockaddr_in Direccion;
	struct sockaddr Cliente;
	socklen_t Longitud_Cliente;
	struct servent *Puerto;
	int Descriptor;

	/*
	* se abre el socket
	*/
	Descriptor = socket (AF_INET, SOCK_STREAM, 0);
	if (Descriptor == -1)
	 	return -1;

	/*
	* Se obtiene el servicio del fichero /etc/services
	*/
/*	
	Puerto = getservbyname (Servicio, "tcp");

	Puerto = 15557;

	if (Puerto == NULL)
		return -1;
*/
	/*
	* Se rellenan los campos de la estructura Direccion, necesaria
	* para la llamada a la funcion bind()
	*/
/*
	struct hostent *Host;
	Host = gethostbyname ("192.168.1.1");
	if (Host == NULL)
		return -1;
*/

	Direccion.sin_family = AF_INET;
//	Direccion.sin_port = Puerto->s_port;
	Direccion.sin_port = htons(15557);
	Direccion.sin_addr.s_addr =INADDR_ANY;
//	Direccion.sin_addr.s_addr = ((struct in_addr *)(Host->h_addr))->s_addr;
	if (bind (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			sizeof(struct sockaddr)) == -1)
	{
		close (Descriptor);
		return -1;
	}

	/*
	* Se avisa al sistema que comience a atender llamadas de clientes
	*/
	if (listen (Descriptor, 1) == -1)
	{
		close (Descriptor);
		return -1;
	}

	/*
	* Se devuelve el descriptor del socket servidor
	*/
	return Descriptor;
}

/**
 * Abre un socket inet de udp.
 * Se le pasa el nombre de servicio del socket al que debe atender.
 * Devuelve el descriptor del socket abierto o -1 si ha habido algún error.
 */
int Abre_Socket_Udp (char *Servicio)
{
	struct sockaddr_in Direccion;
	struct servent *Puerto = NULL;
	int Descriptor;

	/*
	* se abre el socket
	*/
	Descriptor = socket (AF_INET, SOCK_DGRAM, 0);
	if (Descriptor == -1)
	{
	 	return -1;
	}

	/*
	* Se obtiene el servicio del fichero /etc/services
	*/
	Puerto = getservbyname (Servicio, "udp");
	if (Puerto == NULL)
	{
		return -1;
	}

	/*
	* Se rellenan los campos de la estructura Direccion, necesaria
	* para la llamada a la funcion bind() y se llama a esta.
	*/
	Direccion.sin_family = AF_INET;
	Direccion.sin_port = Puerto->s_port;
	Direccion.sin_addr.s_addr = INADDR_ANY; 

	if (bind (
			Descriptor, 
			(struct sockaddr *)&Direccion, 
			sizeof (Direccion)) == -1)
	{
		close (Descriptor);
		return -1;
	}

	/*
	* Se devuelve el descriptor del socket servidor
	*/
	return Descriptor;
}
