# dnsmasq

用于配合 [sniproxy](/sniproxy/README.md) 实现域名代理


```bash
docker run --rm -d \
                --name dnsmasq \
                -p 53:53 \
                -e SNIPROXY=127.0.0.1 \
            uyinn28/dnsmasq
```

```
#!/bin/sh
# /entrypoint.sh


PORT=${PORT:-53}
LISTEN=${LISTEN:-0.0.0.0}
SNIPROXY=${SNIPROXY:-127.0.0.1}

cat /data/dnsmasq.conf.tpl | /bin/envsubst > /etc/dnsmasq.conf

/usr/sbin/dnsmasq -C /etc/dnsmasq.conf ${ARGS} -k
```