FROM v2ray/official

RUN apk --no-cache add \
        gettext   \
        libintl \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk --purge del \
           gettext

# RUN wget -c https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 -o /bin/gosu \
#     && chmod +x gosu \
#     && adduser -D v2ray

ADD vmess-config.json.tpl /etc/v2ray/vmess-config.json.tpl
ADD entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh" ]

