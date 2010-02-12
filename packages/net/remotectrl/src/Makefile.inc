prefix=/usr
DESTDIR=

COPTS=-O2
WOPTS=-pedantic -Werror -Wall
FPIC=-fPIC
CFLAGS=$(COPTS) $(WOPTS) -std=gnu99

AR=ar
CC=gcc
RANLIB=ranlib
INSTALL=install
MKDIR=mkdir

LINK=$(CC)
SHLIB_EXT=so
SHLIB_FLAGS=-shared -Wl,-soname,$(SHLIB_FILE)
