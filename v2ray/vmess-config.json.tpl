{
  "log" : {
    "access": "${ACCESS_LOG}",
    "error": "${ERROR_LOG}",
    "loglevel": "${LOG_LEVEL}"
  },
  "inbound": {
    "port": 8080,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${VMESS_UUID}",
          "level": 1,
          "alterId": 64
        }
      ]
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  }
}