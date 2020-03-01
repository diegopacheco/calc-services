FROM rust:1.41 as build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN RUSTFLAGS="-C target-feature=-crt-static" cargo build --release

FROM debian:stretch-slim
RUN apt-get update -y && apt-get install -y libpq-dev openssl libssl1.0-dev ca-certificates
COPY --from=build /app/target/release/main .
EXPOSE 3000
ENTRYPOINT ["/main"]