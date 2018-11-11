{
  "log" : {
    "access": "${ACCESS_LOG}",
    "error": "${ERROR_LOG}",
    "loglevel": "${LOG_LEVEL}"
  },
  "inbound": {
    "port": 8080,
    "protocol": "shadowsocks",
    "settings": {
      "email": "love@v2ray.com",
      "method": "${SS_METHOD}",
      "password": "${SS_PWD}",
      "udp": false,
      "level": 0,
      "ota": false,
      "network": "tcp"
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  }
}