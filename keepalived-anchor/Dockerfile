FROM docker:18.06

RUN apk --no-cache add bash

COPY keepalived-anchor.sh /

RUN chmod +x /keepalived-anchor.sh

ENTRYPOINT ["/keepalived-anchor.sh"]
