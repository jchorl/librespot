FROM rust:1.42

RUN apt-get update && apt-get install -y \
    build-essential \
    libasound2-dev \
    git
RUN git clone https://github.com/librespot-org/librespot.git
WORKDIR /librespot

# latest as of April 5, 2020
RUN git checkout ef27b4bce371d0a41e7ee2263244ed141684ff9b

RUN cargo build --release

FROM ubuntu:19.10
RUN apt-get update && apt-get install -y \
    libasound2
COPY --from=0 /librespot/target/release/librespot /bin/
ENTRYPOINT /bin/librespot
