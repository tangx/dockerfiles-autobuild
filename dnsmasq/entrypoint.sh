#!/bin/sh
# /entrypoint.sh


export PORT=${PORT:-53}
# export LISTEN=${LISTEN:-0.0.0.0}
export SNIPROXY=${SNIPROXY:-127.0.0.1}
export ARGS

cat /data/dnsmasq.conf.tpl | envsubst > /etc/dnsmasq.conf

/usr/sbin/dnsmasq --conf-file=/etc/dnsmasq.conf ${ARGS} -k