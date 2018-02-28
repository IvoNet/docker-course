FROM alpine

WORKDIR /app

COPY package.json .

RUN apk add --update \
    nodejs \
 && rm -rf /var/cache/apk/* \
 && npm install

COPY server.js .
COPY index.html .
COPY quote.json .

EXPOSE 3000
ENTRYPOINT ["/usr/bin/node", "server.js", "3000"]