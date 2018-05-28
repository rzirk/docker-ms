FROM golang:1.8

RUN go get github.com/oloose/newsletter-ms/...
WORKDIR /go/src/newsletter-ms

CMD newsletter-ms -dbh=mongo start
