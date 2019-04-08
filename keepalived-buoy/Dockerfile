FROM node:8.9.3-slim

WORKDIR /usr/src/app

COPY package.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD [ "npm", "run", "start" ]