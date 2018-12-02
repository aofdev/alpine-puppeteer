FROM node:11-alpine

LABEL maintainer="aof.dev@gmail.com"

RUN apk update && apk upgrade && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
  apk add --no-cache \
  chromium@edge \
  nss@edge \
  && rm -rf /var/cache/apk/* \
  /tmp/*

ENV CHROME_BIN /usr/bin/chromium-browser
