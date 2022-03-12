FROM localhost:5000/alpine

WORKDIR /app

COPY package.json .

RUN apk add --update nodejs npm \
 && rm -rf /var/cache/apk/* \
 && npm install

COPY server.js .
COPY index.html .
COPY quote.json .

EXPOSE 3000
ENTRYPOINT ["/usr/bin/node", "server.js", "3000"]