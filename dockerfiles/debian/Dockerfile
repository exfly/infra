FROM debian:buster
RUN sed -E -i 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*
