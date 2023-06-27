FROM node:20-alpine

COPY package.json /app/helloworld/
COPY src /app/helloworld/

WORKDIR /app/helloworld/

RUN npm install

ENTRYPOINT ["node", "helloworld.js"]
