FROM golang:1.17-alpine AS build

WORKDIR /app
COPY test.go .
RUN GO111MODULE=off go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
# ENTRYPOINT [""]
CMD ["/bin/hello"]
