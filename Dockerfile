FROM node:20-alpine

COPY package.json /app/rajaimage1/
COPY src /app/rajaimage1/

WORKDIR /app/rajaimage1/

RUN npm install

ENTRYPOINT ["node", "helloworld.js"]
