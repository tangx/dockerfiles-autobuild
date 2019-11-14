# dockerfile-v2ray


```bash
export VMESS_UUID=$(curl -s https://www.uuidgenerator.net/api/version4 )
docker run -d -p YOUR_PORT:8081 \
              -e ${VMESS_UUID}=YOUR_UUID \
              uyinn28/v2ray:latest
```


