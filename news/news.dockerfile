FROM golang:1.8

WORKDIR /go/src
RUN git clone https://github.com/oloose/newsletter-ms.git
RUN mv newsletter-ms newsletter-service
WORKDIR /go/src/newsletter-service

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get github.com/go-ozzo/ozzo-routing
RUN go get github.com/globalsign/mgo

RUN dep ensure

RUN go get github.com/oloose/newsletter-ms/...
WORKDIR /go/src/newsletter-ms

CMD newsletter-ms -dbh=mongo start
