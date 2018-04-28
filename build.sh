#!/bin/bash

cd /srv
last_release=$(wget -qO- http://www.haproxy.org/ | grep "Stable version" -B 10 -m1 | grep -o "/download.*tar.gz")
release_n=$(echo "$last_release" | sed -r 's/.*-(.*).tar.gz/\1/')
# assets=$(wget -qO- https://api.github.com/repos/$TRAVIS_REPO_SLUG/releases/latest | jq -r '.assets[].name')
last_r=$(git describe --tags --abbrev=0)
if [ -z "$last_r" -o -z "$release_n" ]; then
    echo "export NEW_RELEASE=false" > /srv/result.env
    exit
fi
if [ "$last_r" = "$release_n" ]; then
    echo "export NEW_RELEASE=false" > /srv/result.env
    exit
fi

lua_p=$(apk search -q lua[0-9].[0-9]-dev | sort | tail -1)
lua_v=${lua_p/-*}
ssl=openssl
apk add alpine-sdk wget $lua_p pcre2-dev $ssl-dev linux-headers zlib-dev

download_url="https://haproxy.org${last_release}"
wget -O haproxy.tar.gz "$download_url"
tar xf haproxy.tar.gz
cd haproxy-*

make -j$(nproc) \
     TARGET=generic \
     ARCH=64 \
     USE_THREAD=1 \
     USE_PTHREAD_PSHARED=1 \
     USE_LIBCRYPT=1 \
     USE_GETADDRINFO=1 \
     USE_TFO=1 \
     USE_NS=1 \
     USE_OPENSSL=1 \
     USE_ZLIB=1 \
     USE_PCRE2=1 \
     USE_PCRE2_JIT=1 \
     USE_LUA=1 \
     LUA_INC="/usr/include/$lua_v" \
     LUA_LD_FLAGS="-lz -L/usr/lib/$lua_v -static"

strip -s haproxy
mv haproxy /srv/haproxy
git tag "$release_n"

echo "export NEW_RELEASE=true release_n=$release_n" > /srv/result.env
