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

# use dumb-init to help prevent zombie chrome processes.
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init

RUN chmod +x /usr/local/bin/dumb-init
RUN npm install -g puppeteer@1.9.0

ENTRYPOINT ["dumb-init", "--"]
