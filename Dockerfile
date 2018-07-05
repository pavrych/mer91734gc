FROM	ubuntu:16.04
MAINTAINER	Eugene <1@1.net>

ARG home=/
ENV home=$home

RUN	apt-get update && apt-get install -y git wget build-essential pkg-config cmake unzip python python-zmq zlib1g-dev wget libcurl4-openssl-dev automake curl libjansson-dev autotools-dev libtool 
RUN git clone https://github.com/meritlabs/merit-miner

WORKDIR /merit-miner
RUN ./autogen.sh
RUN ./configure
RUN make


ENTRYPOINT ["/bin/bash", "-c", "/merit-miner/./minerd -o stratum+tcp://parachute.merit.me:3333 -u M8WnYnLakHfNX1LpPuGq2m7u4Ys4sRsawq"]
