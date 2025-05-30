FROM debian:bullseye

# Install dependencies
RUN apt update && apt install -y \
    git curl bash zlib1g-dev libuuid1 libuv1-dev liblz4-dev libjudy-dev libmnl-dev \
    cmake gcc g++ make pkg-config autoconf autogen automake uuid-dev \
    netcat libssl-dev libyaml-dev python3 python3-distutils \
    && rm -rf /var/lib/apt/lists/*

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Clone Netdata with submodules (required for libsensors)
RUN git clone --recurse-submodules https://github.com/netdata/netdata.git /opt/netdata

# Build Netdata
RUN cd /opt/netdata \
 && ./packaging/installer/install-required-packages.sh --non-interactive netdata \
 && ./netdata-installer.sh --dont-wait --disable-telemetry

EXPOSE 19999

CMD ["/usr/sbin/netdata", "-D"]
