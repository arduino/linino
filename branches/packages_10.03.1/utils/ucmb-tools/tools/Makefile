INSTDIR		= $(prefix)/usr/bin

all: ucmb

ucmb: ucmb.o
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LDLIBS) -o $@
	$(STRIP) $@

%.o: %.c
	$(CC) -c $(CFLAGS) $^ -o $@

install: ucmb
	$(INSTALL) -d $(INSTDIR)
	$(INSTALL) -m 0755 -o 0 -g 0 ucmb $(INSTDIR)

clean:
	rm -f ucmb *.o
