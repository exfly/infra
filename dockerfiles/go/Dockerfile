# syntax=docker/dockerfile:1
# docker.io/docker/dockerfile:1

# docker build -t tmp:tmp .

FROM golang:1.17-alpine AS build

WORKDIR /app

COPY go.mod go.sum ./

RUN env \
	GOSUMDB=sum.golang.google.cn \
	GOPROXY=https://goproxy.io,direct \
	go mod download -x

COPY . .
RUN env \
	GO111MODULE=on \
	CGO_ENABLED=0 \
	go build -o /bin/hello cmd/*.go

FROM alpine:edge

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache tzdata tini \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone

WORKDIR /app

COPY --from=build /bin/hello /bin/hello

USER 1001

EXPOSE 8080

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/hello"]
