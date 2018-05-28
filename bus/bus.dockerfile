FROM golang:1.8

RUN go get github.com/oloose/bus-ms/...
WORKDIR /go/src/bus-ms

CMD bus-ms start
