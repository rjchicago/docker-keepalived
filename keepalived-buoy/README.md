# Keepalived-Buoy

**Keepalived-Buoy** is the "*buoy*" (a.k.a visible entrypoint) into the <a href="https://github.com/rjchicago/docker-keepalived">**Docker-Keepalived**</a> setup.

The buoy is optional, but it provides simple a means of testing and validating keepalived functionality. For example, you may want to configuring uptime monitoring at the floating IP level (i.e. http://$FLOATING_IP:$EXPOSED_PORT/health). You may also want extend buoy to expose additional operational or debugging information.

## Service Defintion

Example service definition for **Keepalived-Buoy**:

```
version: '3.6'

services:
  keepalived-buoy:
    image: rjchicago/keepalived-buoy:${VERSION:-latest}
    ports:
      - target: 3000 # internal port being listened on
        published: 8082 # external port to expose
        protocol: tcp
        mode: host
    environment:
      DOCKER_NODE_HOSTNAME: "{{.Node.Hostname}}" # enable display of current hostname
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 5s
      timeout: 2s
      retries: 3
      start_period: 5s
    deploy:
      mode: global # this will limit running one container per host
      placement:
        constraints:
          - node.role == manager # match constraint of Keepalived Anchor
```