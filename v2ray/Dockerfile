FROM v2ray/official

RUN apk --no-cache add \
        gettext   \
        libintl \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk --purge del \
           gettext

ADD vmess-config.json.tpl /etc/v2ray/vmess-config.json.tpl
ADD entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh" ]

