{
  "log" : {
    "access": "${ACCESS_LOG}",
    "error": "${ERROR_LOG}",
    "loglevel": "${LOG_LEVEL}"
  },
  "inbound": {
    "port": 8081,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${VMESS_UUID}",
          "alterId": ${ALERTID}
        }
      ]
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  }
}