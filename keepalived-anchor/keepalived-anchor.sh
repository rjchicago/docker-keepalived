#!/usr/bin/env bash

CONTAINER_NAME=keepalived-float
IMAGE=${KEEPALIVED_IMAGE:-rjchicago/keepalived-float}

if [ $(docker ps -f "name=$CONTAINER_NAME" --format "{{.Names}}") = "$CONTAINER_NAME" ] ; then
  echo "Removing $CONTAINER_NAME"
  docker rm $CONTAINER_NAME -f
fi

echo "Pulling $IMAGE"
docker pull $IMAGE

echo "Starting $CONTAINER_NAME"
docker run --init --name=$CONTAINER_NAME --rm \
  --cap-add=NET_ADMIN --net=host --pid=host --label hidden \
  -e KEEPALIVED_INTERFACE=$KEEPALIVED_INTERFACE \
  -e KEEPALIVED_VIRTUAL_IPS=$KEEPALIVED_VIRTUAL_IPS \
  -e KEEPALIVED_ROUTER_ID=${KEEPALIVED_ROUTER_ID:-77} \
  -e KEEPALIVED_CHECK_INTERVAL=${KEEPALIVED_CHECK_INTERVAL:-1} \
  -e KEEPALIVED_PRIORITY=${KEEPALIVED_PRIORITY:-100} \
  $IMAGE
