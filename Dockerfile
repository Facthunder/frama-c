FROM ubuntu:20.04 AS base

USER root
WORKDIR /build

RUN apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    ocaml \
    ocaml-native-compilers \
    liblablgtk2-ocaml-dev \
    liblablgtksourceview2-ocaml-dev \
    libocamlgraph-ocaml-dev \
    menhir \
    why3 \
    libyojson-ocaml-dev \
    libocamlgraph-ocaml-dev \
    libzarith-ocaml-dev \
    build-essential \
 && rm -rf /var/lib/apt/lists/* \
 && git clone --single-branch -b tags/21.0 https://git.frama-c.com/pub/frama-c.git . \
 && ./configure \
 && make \
 && make install

FROM ubuntu:19.10

COPY --from=base /usr/local/ /usr/local/

RUN apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
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
