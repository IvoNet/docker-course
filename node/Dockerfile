FROM node:9-alpine

WORKDIR /app
COPY data/ .

RUN npm install

EXPOSE 3000
ENTRYPOINT ["node"]
CMD ["server.js", "3000"]