FROM rust:alpine3.10
RUN mkdir /app
WORKDIR /app
COPY . .
RUN apk --no-cache add --update curl g++ build-base
RUN RUSTFLAGS="-C target-feature=-crt-static" cargo build --release
CMD ["/app/target/release/main"]