/**
 * Javier Abellán. 14 Abril 2003
 *
 * Funciones para que un servidor puede abrir sockets para atender un servicio y aceptar
 * conexiones de un cliente.
 */
#ifndef _SOCKET_SERVIDOR_H
#define _SOCKET_SERVIDOR_H

/**
 * Abre un socket INET para atender al servicio cuyo nombre es Servicio.
 * El Servicio debe estar dado de alta en /etc/services como tcp.
 * Devuelve el descriptor del socket que atiende a ese servicio o -1 si ha habido error.
 */
int Abre_Socket_Inet (char *Servicio);


/**
 * Abre un socket UDP para atender al servicio cuyo nombre es Servicio.
 * El Servicio debe estar dado de alta en /etc/services como udp.
 * Devuelve el descriptor del socket que atiende a ese servicio o -1 si ha habido error.
 */
int Abre_Socket_Udp (char *Servicio);


/**
 * Abre un socket UNIX para atender al servicio cuyo nombre es Servicio.
 * Devuelve el descriptor del socket que atiende a ese servicio o -1 si ha habido error.
 */
int Abre_Socket_Unix (char *Servicio);

/**
 * Acepta un cliente para un socket INET.
 * Devuelve el descriptor de la conexión con el cliente o -1 si ha habido error.
 */
int Acepta_Conexion_Cliente (int Descriptor);

#endif
