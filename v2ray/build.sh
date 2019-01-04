#!/bin/bash

cd $(dirname $0)
source version
sudo docker build -f Dockerfile -t v2ray:${version}  . $@ 
