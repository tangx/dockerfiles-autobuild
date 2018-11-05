FROM alpine:latest

RUN apk add --update --no-cache \
    sniproxy
COPY ./sniproxy.conf /etc/sniproxy/sniproxy.conf


CMD ["sniproxy", "-f" , "-c", "/etc/sniproxy/sniproxy.conf"]

