# RUST-DOCKER

Docker image with different version of rust along with clippy and rustfmt preinstalled.

## Contains

#### Images

| Images          | Versions              |
|:---------------:|:---------------------:|
| OS              |[List of OS](#####OS)  |
| rustup          | default               | 
| rust            | stable, beta, nightly |
| rust-clippy     | stable, beta, nightly |
| rust-fmt        | stable, beta, nightly |
| rust-fmt-clippy | stable, beta, nightly |

##### OS

| Ubuntu  |
|:-------:|
| latest  |
| rolling |


### Tags formats

| Images | Tags Format| Example |
|:------:|:----------:|:-------:|
| ```${os_type}``` | ```{os_version}``` | ```iamsauravsharma/ubuntu:latest```         |
| rustup | ```${os_type}-${version}```  | ```iamsauravsharam/rustup:ubuntu-rolling``` |
| rust   | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust:stable-ubuntulatest``` |
| rust-clippy       | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-clippy:stable-ubuntulatest```    |
| rust-fmt          | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-fmt:nightly-ubunturolling```     |
| rust -fmt-clippy  | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-fmt-clippy:beta-ubunturolling``` |