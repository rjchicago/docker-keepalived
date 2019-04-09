# Keepalived-Anchor

**Keepalived-Anchor** is the "*anchor*" in the <a href="https://github.com/rjchicago/docker-keepalived">**Docker-Keepalived**</a> setup.

Its job is simple and critical - deploy **Keepalived-Float** (a.k.a. "*the float*") and ensure that it is running at all times. This is accomplished by creating a sidecar container on the main process thread. If the float container exits for any reason, then the anchor service restarts, and the workflow repeats with a new float container being created.

Similarly, the float monitors the anchor. If the anchor process is stopped (i.e. container dies or is removed), the keepalived will switch the current node to backup and the floating IP will transfer to a new master.

## Service Defintion

Example service definition for **Keepalived-Anchor**:

```
version: '3.6'

services:
  keepalived-anchor:
    image: rjchicago/keepalived-anchor:${VERSION:-latest}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # required for connecting to host docker
    environment:
      - KEEPALIVED_IMAGE=rjchicago/keepalived-float:${VERSION:-latest} # image to be deployed as the float
      - KEEPALIVED_INTERFACE=bond0 # set this to the network interface bond for your host group
      - KEEPALIVED_VIRTUAL_IPS=192.168.0.9 # set to the floating IP assigned for your IP subnet
    deploy:
      mode: global # this will limit running one container per host
      placement:
        constraints:
          - node.role == manager # docker commands require to be run on manager nodes
```
