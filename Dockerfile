FROM rust:latest

# Install alternative linker
RUN apt update
RUN apt install lld clang -y

# Install linting and formatting support from rustup
RUN rustup component add clippy
RUN rustup component add rustfmt

# Install auditing and code coverage from cargo
RUN cargo install cargo-tarpaulin
RUN cargo install cargo-audit

