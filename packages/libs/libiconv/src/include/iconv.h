/*
 * Very simple iconv api stub.
 */

#ifndef _ICONV_H
#define _ICONV_H 1

#include <stddef.h>

typedef void *iconv_t;

extern iconv_t
iconv_open(const char *tocode, const char *fromcode);

extern size_t
iconv(iconv_t cd, char **inbuf, size_t *inbytesleft,
                  char **outbuf, size_t *outbytesleft);

extern int
iconv_close(iconv_t cd);

#endif /* _ICONV_H */
