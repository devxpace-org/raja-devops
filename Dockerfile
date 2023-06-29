FROM node:20-alpine

COPY package.json /app/rksimha/
COPY src /app/rksimha/

WORKDIR /app/rksimha/

RUN npm install

ENTRYPOINT ["node", "helloworld.js"]
