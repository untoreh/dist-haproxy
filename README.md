```
HA-Proxy version 1.8.8 2018/04/19
Copyright 2000-2018 Willy Tarreau <willy@haproxy.org>

Build options :
  TARGET  = generic
  CPU     = generic
  CC      = gcc
  CFLAGS  = -m64 -O2 -g -fno-strict-aliasing -Wdeclaration-after-statement -fwrapv -fno-strict-overflow -Wno-null-dereference -Wno-unused-label
  OPTIONS = USE_LIBCRYPT=1 USE_GETADDRINFO=1 USE_ZLIB=1 USE_THREAD=1 USE_OPENSSL=1 USE_LUA=1 USE_PCRE2=1 USE_PCRE2_JIT=1 USE_TFO=1 USE_NS=1

Default settings :
  maxconn = 2000, bufsize = 16384, maxrewrite = 1024, maxpollevents = 200

Built with OpenSSL version : OpenSSL 1.0.2o  27 Mar 2018
Running on OpenSSL version : OpenSSL 1.0.2o  27 Mar 2018
OpenSSL library supports TLS extensions : yes
OpenSSL library supports SNI : yes
OpenSSL library supports : SSLv3 TLSv1.0 TLSv1.1 TLSv1.2
Built with Lua version : Lua 5.3.4
Built with transparent proxy support using: IP_TRANSPARENT IPV6_TRANSPARENT IP_FREEBIND
Encrypted password support via crypt(3): yes
Built with multi-threading support.
Built with PCRE2 version : 10.30 2017-08-14
PCRE2 library supports JIT : yes
Built with zlib version : 1.2.11
Running on zlib version : 1.2.11
Compression algorithms supported : identity("identity"), deflate("deflate"), raw-deflate("deflate"), gzip("gzip")
Built with network namespace support.

Available polling systems :
       poll : pref=200,  test result OK
     select : pref=150,  test result OK
Total: 2 (2 usable), will use poll.

Available filters :
        [SPOE] spoe
        [COMP] compression
        [TRACE] trace
```
