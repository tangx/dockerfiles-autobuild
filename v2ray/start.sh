#!/bin/bash

cd $(dirname $0)

case $1 in 
build)
    docker-compose -f docker-compose.yml -f docker-compose.build.yml build ;;
push)
    docker-compose -f docker-compose.yml -f docker-compose.build.yml push ;;
*)
    docker-compose -f docker-compose.yml up -d  ;;
esac

