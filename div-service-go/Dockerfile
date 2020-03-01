FROM golang:1.12.0-alpine3.9
RUN apk add --no-cache git mercurial \
    && go get -u github.com/gin-gonic/gin \
    && apk del git mercurial
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .
CMD ["/app/main"]