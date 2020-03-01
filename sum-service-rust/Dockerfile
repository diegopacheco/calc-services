FROM rust:latest as cargo-build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN cargo build --release
FROM alpine:latest
COPY --from=cargo-build /app/target/release/main /usr/local/bin/main
CMD ["/usr/local/bin/main"]