FROM alpine:3.4
MAINTAINER Oliver Eilhard <oliver.eilhard@meplato.com>
RUN apk --update upgrade && \
    apk add sqlite && \
    rm -rf /var/cache/apk/*
# See http://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
ADD sqlite-docker /sqlite-docker
WORKDIR /
CMD ["/sqlite-docker"]
