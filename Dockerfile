FROM ocaml/opam2:ubuntu-19.04-opam

RUN sudo apt-get update -y \
 && sudo apt-get install -y m4 #zlib1g-dev libgmp-dev libgtksourceview2.0-dev libgnomecanvas2-dev autoconf -y \
RUN opam init -a \
 && opam update \
 && opam install -y --unlock-base frama-c coq why3 alt-ergo 
            
#USER framac
WORKDIR /src
LABEL maintainer="begarco"
