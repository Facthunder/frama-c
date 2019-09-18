FROM ocaml/opam2:alpine-3.10-opam

RUN sudo apt-get update -y \
    sudo apt-get install zlib1g-dev libgmp-dev libgtksourceview2.0-dev libgnomecanvas2-dev autoconf -y \
    opam update \
    opam install frama-c coq why3 alt-ergo -y

USER framac
LABEL maintainer="begarco"
