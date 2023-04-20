# Rust Docker CI

[![Dockerhub Badge][]][Dockerhub] [![Github Badge][]][Github]

This is an image created to minimize Gitlab CI build/test times for rust projects by caching the tools previously installed during the CI process.

## Included Tools

- LLD and Clang for faster linking
- Clippy for linting
- rustfmt for formatting
- cargo-tarpaulin for code coverage
- cargo-audit to check for known vulnerabilities

## Image Size

The `rust:latest` image on which this is built is already quite large, 1.39GB at time of writing. These additions bring the image size up to 2.25GB, which seems like too much space for just these tools.

I've not looked at exactly how much there is to save but I can't imagine these tools add up to nearly a gigabyte. My suspicion is that intermediate build files may account for this, though I don't know where those files are. Changing `cargo install --target-dir` to a known directory and then deleting that directory didn't substantially change the image size. I suspect there's a similar compilation step for `rustup component add` with shared dependencies to the `cargo install`ed tools, but I don't know where that is located.

Alternatively, these tools could just be _that big_.

[Github]: https://github.com/Estus-Dev/rust-docker-ci
[Github Badge]: https://img.shields.io/badge/source-github-lightgrey

[Dockerhub]: https://hub.docker.com/repository/docker/estusdev/rust-ci
[Dockerhub Badge]: https://img.shields.io/badge/dockerhub-latest-brightgreen