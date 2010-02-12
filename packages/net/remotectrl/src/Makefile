ifndef CFLAGS
CFLAGS = -O2 -g -I ../src
endif
VERSION=0.1

LIBS=-lnl 

# Ficheros objeto que van dentro de la minilibrería.
LIBCHSOCK=\
	Socket_Servidor.o\
	Socket_Cliente.o\
	Socket.o

all: servselect clientselect server_socket
# clientselect libChSocket.a

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

#libChSocket.a : libChSocket.a($(LIBCHSOCK))

servselect: servselect.o Socket_Servidor.o Socket.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clientselect: clientselect.o Socket.o Socket_Cliente.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
#	cc clientselect.c -I$(LIBCHSOCKET) -L$(LIBCHSOCKET) -lChSocket -o clientselect

server_socket: server_socket.o remotectrl.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
