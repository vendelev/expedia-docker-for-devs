FROM debian:jessie

LABEL maintainer My Name <myemail@example.com>
LABEL refreshed_at 2017-03-13

RUN apt-get update \
    && apt-get install -y redis-server \
    && mkdir -p /var/db

EXPOSE 6379
VOLUME /var/db

WORKDIR /var/db

ENTRYPOINT ["/usr/bin/redis-server"]
