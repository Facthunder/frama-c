FROM ubuntu:19.04 AS base

USER root
WORKDIR /build

RUN apt-get update -y \
 && apt-get install -y \
    git \
    ocaml \
    libyojson-ocaml-dev \
    libocamlgraph-ocaml-dev \
    libzarith-ocaml-dev \
    build-essential \
 && rm -rf /var/lib/apt/lists/* \
 && git clone --single-branch https://github.com/Frama-C/Frama-C-snapshot.git . \
 && git checkout -b tags/19.1 \
 &&  ./configure \
 && make \
 && make install

FROM ubuntu:19.04

COPY --from=base /usr/local/ /usr/local/

RUN apt-get update -y \
 && apt-get install -y \
    libfindlib-ocaml \
    libocamlgraph-ocaml-dev \
    libzarith-ocaml \
    libyojson-ocaml-dev \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd -r frama-c \
 && useradd --no-log-init -r -g frama-c frama-c

USER frama-c
WORKDIR /src
ENTRYPOINT ["frama-c"]
