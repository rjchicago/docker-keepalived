FROM docker:20.10

RUN apk --no-cache add bash

COPY keepalived-anchor.sh /

RUN chmod +x /keepalived-anchor.sh

ENTRYPOINT ["/keepalived-anchor.sh"]
