FROM alpine:3.8

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories 
RUN apk add --update --no-cache \
            dnsmasq \
            gettext \
            libintl \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk del --purge \
               gettext

COPY ./entrypoint.sh  /entrypoint.sh
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]

COPY ./dnsmasq.conf.tpl  /data/dnsmasq.conf.tpl 
