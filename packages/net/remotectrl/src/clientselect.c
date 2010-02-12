/*
 * Javier Abellán. 14 de Abril de 2003
 *
 * Ejemplo de como un servidor puede manejar varios clientes con select().
 * Este programa hace de cliente de dicho servidor.
 */
#include "Socket.h"
#include "Socket_Cliente.h"

/* Programa principal. Abre la conexión, recibe su número de cliente y
 * luego envía dicho número cada segundo */
main()
{
	int sock;		/* descriptor de conexión con el servidor */
	struct s_msg *buffer;		/* buffer de lectura de datos procedentes del servidor */
	int error;		/* error de lectura por el socket */
	buffer = malloc(sizeof(struct s_msg));
	/* Se abre una conexión con el servidor */
	sock = Abre_Conexion_Inet ("localhost", "cpp_java");

	/* Se lee el número de cliente, dato que nos da el servidor. Se escribe
	 * dicho número en pantalla.*/
	error = ReadTcpSocket (sock, &buffer);
//	struct s_msg Datos;
//	*Datos = malloc(sizeof struct s_msg);
//	error = ReadTcpSocket (sock, &Datos);
//	printf("%d %d %s\n",Datos.type, Datos.command, Datos.data);
	/* Si ha habido error de lectura lo indicamos y salimos */
	if (error < 1)
	{
		printf ("Me han cerrado la conexión\n");
		exit(-1);
	}
printf("Se leyeron %d bytes\n", error);
	/* Se escribe el número de cliente que nos ha enviado el servidor */
	printf ("type=%d\ncommand=%d\nlen=%d\ndata=%s\n", buffer->type, buffer->command, buffer->len, buffer->data);
	printf ("Soy cliente\n%s\n", buffer);

	/* Bucle infinito. Envia al servidor el número de cliente y espera un
	 * segundo */
//	while (1)
//	{
//		Escribe_Socket (sock, (char *)&buffer, sizeof(int));
//		sleep (1);
//	}
}

