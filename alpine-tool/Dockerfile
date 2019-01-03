# alpine:3.8
FROM alpine:3.8

# 命令安装包 https://pkgs.alpinelinux.org/packages

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories 
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories 

RUN apk add --update --no-cache \
            nginx \
    && mkdir -p /run/nginx

RUN apk add --update --no-cache \
            curl \
            gettext \
            libintl \
            busybox-extras \
            # bind-tools \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk del --purge gettext

COPY help.sh /bin/help.sh
RUN chmod +x /bin/help.sh
COPY help.md /help.md

CMD ["nginx", "-g", "daemon off;"]

