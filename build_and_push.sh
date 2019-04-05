#!/bin/bash

# set version if supplied
if [ "$1" != "" ] ; then
  export VERSION=$1
fi

# build & push
docker-compose -f docker-stack.yml build
docker-compose -f docker-stack.yml push