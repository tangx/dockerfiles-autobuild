#!/bin/bash

cd $(dirname $0)
sudo docker build -f Dockerfile -t v2ray:${version}  . $@ 
