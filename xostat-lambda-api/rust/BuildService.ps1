# Get the service name as a parameter
param (
    [Parameter(Mandatory=$true)]
    [string]$ServiceName
)

# Set the working directory
$workingDirectory = ".\services\$ServiceName"

# Build the Rust project to generate Cargo.lock
Set-Location -Path $workingDirectory
cargo build --target=x86_64-unknown-linux-musl

# Create a Dockerfile for the service
@"
FROM rust:1.56.0 as builder

# Install musl
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y musl-tools \
    && rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/$ServiceName

# Cache dependencies
COPY ./services/$ServiceName ./
RUN mkdir src \
    && echo "fn main() {}" > src/main.rs \
    && cargo build --release --target=x86_64-unknown-linux-musl \
    && rm -rf target/x86_64-unknown-linux-musl/release/.fingerprint/$ServiceName-*

# Build application
RUN cargo build --release --target=x86_64-unknown-linux-musl

FROM alpine:latest

# Copy binary from builder to this new stage
COPY --from=builder /usr/src/$ServiceName/target/x86_64-unknown-linux-musl/release/$ServiceName /usr/local/bin/

CMD ["$ServiceName"]
"@ | Set-Content Dockerfile

# Now you can build the Docker image for the service
docker build -t rust-musl-builder:$ServiceName .
