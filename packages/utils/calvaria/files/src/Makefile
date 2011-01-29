DESTDIR		?=
PREFIX		?= /usr
CFLAGS		?= -O2 -Wall
LDFLAGS		?=
LDLIBS		?=

STRIP		?= strip
INSTALL		?= install

BIN		:= calvaria

all: $(BIN)

$(BIN): calvaria.o
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@
	$(STRIP) $@

%.o: %.c
	$(CC) -c $(CFLAGS) $^ -o $@

install: $(BIN)
	$(INSTALL) -d $(DESTDIR)/$(PREFIX)/bin
	$(INSTALL) -m 0755 $(BIN) $(DESTDIR)/$(PREFIX)/bin/

clean:
	rm -f $(BIN) *.o
