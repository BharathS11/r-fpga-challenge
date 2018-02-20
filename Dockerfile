FROM debian:9.3-slim

# install verilator and ghdl
# ghdl depends on libgnat-6
# verilator depends on perl
# all in one step to keep the image size small
RUN apt-get update && \
    apt-get install -y --no-install-recommends libgnat-6 wget ca-certificates perl verilator iverilog build-essential && \
    mkdir ghdl && \
    cd ghdl && \
    wget https://github.com/ghdl/ghdl/releases/download/v0.35/ghdl-0.35-mcode-stretch.tgz -O ghdl.tgz && \
    tar -xvf ghdl.tgz && \
    rm ghdl.tgz && \
    mv lib/* /usr/local/lib/ && \
    mv bin/* /usr/local/bin/ && \
    mv include/* /usr/local/include/ && \
    apt-get remove -y wget ca-certificates && \
    rm -rf /etc/apt/cache

WORKDIR /project
