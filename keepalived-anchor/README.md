# Keepalived Anchor

**Keepalived Anchor** is the *anchor* in the **Keepalived Docker** setup.

## Service Defintion

Example service definition for **Keepalived Anchor**:

```
  keepalived-anchor:
    image: rjchicago/keepalived-anchor:${VERSION:-latest}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # required for connecting to host docker
    environment:
      - KEEPALIVED_IMAGE=rjchicago/keepalived-float:${VERSION:-latest} # image to be deployed as the float
      - KEEPALIVED_INTERFACE=bond0 # set this to the network interface bond for your host group
      - KEEPALIVED_VIRTUAL_IPS=192.168.0.9 # set to the floating IP assigned for your IP subnet
    deploy:
      mode: global # this will run one container per host
      placement:
        constraints:
          - node.role == manager # docker commands require to be run on manager nodes
```
