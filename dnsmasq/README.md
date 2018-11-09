# dnsmasq

用于配合 [sniproxy](/sniproxy/README.md) 实现域名代理


```bash
export SNIPROXY=127.0.0.1
docker run -d --restart always \
            --cap-add=NET_ADMIN  \
            -e SNIPROXY=${SNIPROXY} \
            -p 53:53/udp -p 53:53/tcp  \
            --name dnsmasq  \
        uyinn28/dnsmasq
```
