FROM rust:latest

# Install alternative linker and psql
RUN apt update \
    && apt install lld clang postgresql-client -y \
    && rm -rf /var/lib/apt/lists/*;

# Install linting and formatting support from rustup
RUN rustup component add clippy
RUN rustup component add rustfmt

# Install auditing and code coverage from cargo
RUN cargo install cargo-tarpaulin
RUN cargo install cargo-audit

# Install sqlx from cargo
RUN cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
