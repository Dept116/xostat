### Installing Ubuntu WSL on windows

Install WSL

```bash
wsl --install
wsl --set-default-version 2 Ubuntu
```

Confirm correct installation

```bash
wsl -l -v
```

Launch Ubuntu WSL

```bash
ubuntu
```

Download Dependencies

```bash
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install libzstd-dev
sudo apt-get install libbz2-dev

sudo snap install zig --classic --beta
```

Navigate to rust project directory (Replace the name unless your name is also Morgan Hall)

```bash
cd /mnt/c/Users/morgh/xostat/xostat/xostat-lambda-api/rust/
```

### Install Rust (Start Here if you're on Linux or Mac)

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install target toolchain

local development and testing can be done using the system-native toolchain automatically shipped by rustup

```bash
rustup target add aarch64-unknown-linux-gnu
```

### Install cargo-lambda

Core utility for testing and deploying lambda functions

```bash
cargo install cargo-lambda
```

### Creating new services or libraries

Creating a service.

```bash
cd ./services
cargo new hello_world
```

### Creating new lambda project (from scratch)

(Substitute $VARNAME with corresponding values)

```bash
cargo lambda new $PROJECT_NAME
```

### Build release in zip format

```bash
cargo lambda build --release --arm64 --output-format zip
```

Add to serverless.yml

(Substitute $VARNAME with corresponding values)

```bash
functions:
  $FUNCTION_NAME:
    handler: $FUNCTION_NAME
    package:
      artifact: ./target/lambda/$FUNCTION_NAME/bootstrap.zip
```
