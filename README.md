
# Docker-Keepalived

**Docker-Keepalived** enables you to run **Keepalived** in your Docker Swarm.

## Why would you want to run Keepalived in Docker Swarm?

If you've found this project, chances are that you have your reasons. More than likely, you simply want to avoid an additional load-balancer in front your Swarm. Now, with **Docker-Keepalived**, you can do just that!

## Services in the **Docker-Keepalived** Project

* [**Keepalived-Anchor**](https://github.com/rjchicago/docker-keepalived/tree/master/keepalived-anchor)
  * The Anchor is deployed in global mode with a constraint to only run on managers as it requires execution of docker commands to deploy the Float. The Anchor's primary duty is ensuring the float is created and running at all times.
* [**Keepalived-Float**](https://github.com/rjchicago/docker-keepalived/tree/master/keepalived-float)
  * The Float is deployed by the Anchor and is the container running Keepalived. Its primary duty is broadcasting the [Floating IP](https://serverfault.com/a/536367/56017). It maintains a connection to the Anchor by monitoring its process, and if severed and in master state, the Float will switch to backup state. The role of master will then be picked up by the Float on the next manager node.
* [**Keepalived-Buoy**](https://github.com/rjchicago/docker-keepalived/tree/master/keepalived-buoy)
  * The Buoy is also deployed in global mode with a constraint to only run on managers to match that of the Anchor. It is the visible layer, exposing health and other operational and debugging information. The Buoy itself is not critical to the system and could optionally be omitted from a deployment.

## Deploy

``` sh
docker stack deploy -c docker-compose.yml keepalived --prune
```

## Contributing

``` sh
# build & push $VERSION
set -o allexport; source .env; set +o allexport
docker-compose -f docker-compose.ci.yml build
docker-compose -f docker-compose.ci.yml push

# build & push "latest"
export VERSION=latest
docker-compose -f docker-compose.ci.yml build
docker-compose -f docker-compose.ci.yml push
```
