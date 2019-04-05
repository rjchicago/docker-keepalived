FROM docker:18.06

RUN apk --no-cache add bash nodejs-npm

COPY package.json .
RUN npm install --quiet

COPY . .
RUN chmod +x /keepalived_tether

EXPOSE 3000
ENTRYPOINT ["/keepalived_tether"]