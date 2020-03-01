FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git
RUN mkdir /app
WORKDIR /app
COPY . .
RUN go get -d -v \ 
    && RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app/div-service-go
FROM scratch
COPY --from=builder /app/div-service-go /app/div-service-go
ENTRYPOINT ["/app/div-service-go"]