FROM node:10-alpine

RUN apk update && apk upgrade && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
  apk add --no-cache \
  chromium@edge \
  nss@edge \
  vim@edge \
  && rm -rf /var/cache/apk/* \
  /tmp/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENV CHROME_BIN /usr/bin/chromium-browser

RUN npm install -g puppeteer@1.4.0
