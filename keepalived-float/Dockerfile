FROM ubuntu:18.10

RUN apt-get update && apt-get install -y keepalived

RUN useradd keepalived_script && usermod -aG sudo keepalived_script

COPY keepalived-float.sh /

RUN chmod +x /keepalived-float.sh

ENTRYPOINT ["/keepalived-float.sh"]