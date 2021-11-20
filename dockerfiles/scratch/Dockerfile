FROM golang:1.17-alpine AS build

WORKDIR /app
COPY ./test.go .
RUN go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
ENTRYPOINT ["/bin/hello"]
CMD []
