FROM ubuntu:18.10

RUN apt-get update && apt-get install -y keepalived

RUN useradd keepalived_script && usermod -aG sudo keepalived_script

COPY keepalived_float /

RUN chmod +x /keepalived_float

ENTRYPOINT ["/keepalived_float"]