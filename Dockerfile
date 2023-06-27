FROM node:20-alpine

COPY package.json /app/nicejob/
COPY src /app/nicejob/

WORKDIR /app/nicejob/

RUN npm install

ENTRYPOINT ["node", "helloworld.js"]
