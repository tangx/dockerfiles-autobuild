FROM nginx:alpine

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories 
RUN apk add --update --no-cache \
            curl \
            gettext \
            libintl \
            busybox-extras \
    && cp /usr/bin/envsubst /bin/envsubst \
    && apk del --purge gettext