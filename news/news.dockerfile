FROM golang:1.8

WORKDIR /go/src
RUN git clone https://github.com/oloose/newsletter-ms.git
RUN mv newsletter-ms newsletter-service
WORKDIR /go/src/newsletter-service

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get github.com/go-ozzo/ozzo-routing
RUN go get github.com/globalsign/mgo

RUN dep ensure

RUN go get -d -v ./...
RUN go install -v ./cmd/newsletter-service/.

CMD newsletter-service -dbh=mongo start