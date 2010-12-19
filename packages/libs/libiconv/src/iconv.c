/*
 * Simple iconv library stub so that programs have something to link against
 */

#include <stddef.h>

typedef void *iconv_t;

iconv_t iconv_open (const char *tocode, const char *fromcode)
{
	return (iconv_t)(-1);
}

size_t iconv (iconv_t cd, char **inbuf, size_t *inbytesleft,
                          char **outbuf, size_t *outbytesleft)
{
  	return 0;
}

int iconv_close (iconv_t cd)
{
	return 0;
}
