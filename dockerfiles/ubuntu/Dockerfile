FROM ubuntu:latest
# RUN  sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -E -i -e 's/(archive|ports).ubuntu.com/mirrors.aliyun.com/g' -e '/security.ubuntu.com/d' /etc/apt/sources.list

# ADD someCA.pem /usr/local/share/ca-certificates/some-ca.crt
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates
