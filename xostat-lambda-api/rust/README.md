### Installing Rust

Rust requires Visual Studio 2013 or greater C++ tools, instructions on how to do so are below:

https://rust-lang.github.io/rustup/installation/windows-msvc.html

After run rustup-init from the following site:

https://rustup.rs/

Projects need to be built with the `aarch64-unknown-linux-gnu` environment to be compatible with AWS lambda.

### Install target toolchain for Linux 2 deployment
Note: Only required for building artifacts and deploying to Linux 2  
local development and testing can be done using the system-native toolchain automatically shipped by rustup

```bash
rustup target add aarch64-unknown-linux-gnu --minimal
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

## Deploying

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
