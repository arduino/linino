/*
 * Simple iconv library stub so that programs have something to link against
 */

#include <stddef.h>
#include <string.h>
#include <errno.h>
#include <iconv.h>

int _libiconv_version = _LIBICONV_VERSION;

iconv_t iconv_open (const char *tocode, const char *fromcode)
{
	/* ASCII -> UTF8 and ASCII -> ISO-8859-x mappings can be
	 * faked without doing any actual conversion, mapping
	 * between identical charsets is a no-op, so claim to
	 * support those. */
	if (!strncasecmp(fromcode, tocode, strlen(fromcode)) ||
	    (!strncasecmp(tocode,   "UTF-8",     strlen("UTF-8")) &&
	     !strncasecmp(fromcode, "ASCII",     strlen("ASCII"))) ||
	    (!strncasecmp(tocode,   "ISO-8859-", strlen("ISO-8859-")) &&
	     !strncasecmp(fromcode, "ASCII",     strlen("ASCII"))))
	{
		return (iconv_t)(1);
	}
	else
	{
		return (iconv_t)(-1);
	}
}

size_t iconv (iconv_t cd, char **inbuf, size_t *inbytesleft,
                          char **outbuf, size_t *outbytesleft)
{
	size_t len = 0;

	if (cd == (iconv_t)(1))
	{
		if ((*inbytesleft < 0) || (*outbytesleft < 0) ||
		    (outbuf == NULL) || (*outbuf == NULL))
		{
			errno = EINVAL;
			return (size_t)(-1);
		}

		if ((inbuf != NULL) && (*inbuf != NULL))
		{
			len = (*inbytesleft > *outbytesleft)
				? *outbytesleft : *inbytesleft;

			memcpy(*outbuf, *inbuf, len);

			*inbuf        += len;
			*inbytesleft  -= len;
			*outbuf       += len;
			*outbytesleft -= len;

			if (*inbytesleft > 0)
			{
				errno = E2BIG;
				return (size_t)(-1);
			}
		}

		return (size_t)(0);
	}
	else
	{
		errno = EBADF;
		return (size_t)(-1);
	}
}

int iconv_close (iconv_t cd)
{
	return 0;
}
