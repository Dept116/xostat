FROM rust:1.56.0 as builder

# Install musl
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y musl-tools \
    && rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/hello_world

# Cache dependencies
COPY services/hello_world ./
RUN mkdir src \
    && echo "fn main() {}" > src/main.rs \
    && cargo build --release --target=x86_64-unknown-linux-musl \
    && rm -rf target/x86_64-unknown-linux-musl/release/.fingerprint/hello_world-*

# Build application
COPY services/hello_world . 
RUN cargo build --release --target=x86_64-unknown-linux-musl

FROM alpine:latest

# Copy binary from builder to this new stage
COPY --from=builder /usr/src/hello_world/target/x86_64-unknown-linux-musl/release/hello_world /usr/local/bin/

CMD ["hello_world"]
