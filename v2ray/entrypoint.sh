#!/bin/sh
#
# /entrypoint.sh
#

export PROTOCOL=${PROTOCOL:-"vmess"}
export ACCESS_LOG=${ACCESS_LOG:-"/dev/stdout"}
export ERROR_LOG=${ERROR_LOG:-"/dev/stdout"}
export LOG_LEVEL=${LOG_LEVEL:-"warning"}
export VMESS_UUID=${VMESS_UUID:-"12345678-0000-0000-0000-1234567890ab"}

# cat /etc/v2ray/${PROTOCOL}-config.json.tpl | envsubst > /etc/v2ray/config.json

envsubst < /etc/v2ray/${PROTOCOL}-config.json.tpl > /etc/v2ray/config.json 

v2ray -config /etc/v2ray/config.json

# exec gosu v2ray v2ray -config /etc/v2ray/config.json

