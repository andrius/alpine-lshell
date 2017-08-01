# vim:set ft=dockerfile:
FROM alpine:latest

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk --update add curl python \
&&  mkdir -p /usr/src && cd /usr/src \
&&  curl -sf -o lshell.tar.gz -L https://github.com/ghantoos/lshell/releases/download/0.9.18/lshell_0.9.18.tar.gz \
&&  tar -zxvf lshell.tar.gz \
&&  cd lshell* \
&&  python setup.py install --no-compile --install-scripts=/usr/bin/ \
&&  cd .. \
&&  rm -rf lshell* \
&&  apk del curl \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

