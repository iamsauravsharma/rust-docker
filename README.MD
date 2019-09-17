# RUST-DOCKER

Docker image with different version of rust along with clippy and rustfmt preinstalled. Only latest image where all components are available is build and published out daily.

**Status:**

| Travis Build Status |
|:---:|
| [![Travis Build Status][build_badge]][build_link] |

**Project Info:**

| License | LoC |
|:-------:|:---:|
| [![License: MIT][license_badge]][license_link] | [![LoC][loc_badge]][loc_link] |

## Contains

#### Images

| Images          | Versions              |
|:---------------:|:---------------------:|
| OS              |[List of OS](#OS)      |
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
| ```${os_type}``` | ```{os_version}```                            | ```iamsauravsharma/ubuntu:latest```                      |
| rustup           | ```${os_type}-${version}```                   | ```iamsauravsharam/rustup:ubuntu-rolling```              |
| rust             | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust:stable-ubuntulatest```           |
| rust-clippy      | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-clippy:stable-ubuntulatest```    |
| rust-fmt         | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-fmt:nightly-ubunturolling```     |
| rust-fmt-clippy  | ```${rust_version}-${os_name}${os_version}``` | ```iamsauravsharma/rust-fmt-clippy:beta-ubunturolling``` |

Similarly all of images support latest and as well as rust, rust-clippy, rust-fmt, rust-fmt-clippy supports out stable beta nightly value as well

[build_badge]: https://img.shields.io/travis/com/iamsauravsharma/rust-docker.svg?logo=travis
[build_link]: https://travis-ci.com/iamsauravsharma/rust-docker

[license_badge]: https://img.shields.io/github/license/iamsauravsharma/rust-docker.svg
[license_link]: LICENSE

[loc_badge]: https://tokei.rs/b1/github/iamsauravsharma/rust-docker
[loc_link]: https://github.com/iamsauravsharma/rust-docker