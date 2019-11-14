FROM v2ray/official

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --no-cache add \
        gettext   \
        libintl \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk --purge del \
           gettext

ADD vmess-config.json.tpl /etc/v2ray/vmess-config.json.tpl
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh" ]

