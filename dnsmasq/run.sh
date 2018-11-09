#!/bin/bash

docker run -d --rm --cap-add=NET_ADMIN  -e SNIPROXY=${SNIPROXY} -p 53:53/udp -p 53:53/tcp  --name dnsmasq  dnsmasq:manual