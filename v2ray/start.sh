#!/bin/bash

case $1 in 
build)
    docker-compose -f docker-compose.yml -f docker-compose.build.yml build ;;
server)
    docker-compose -f docker-compose.yml up -d v2rayserver ;;
client)
    ;;
esac
