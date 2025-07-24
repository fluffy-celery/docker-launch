FROM ubuntu:22.04

# Fix non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Install QEMU and required tools
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    iproute2 \
    iputils-ping \
    net-tools \
    socat \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /vjunos

# Copy image and startup script
COPY vJunos-router-23.2R1.15.qcow2 /vjunos/vjunos.qcow2
COPY start.sh /vjunos/start.sh
RUN chmod +x /vjunos/start.sh

ENTRYPOINT ["/vjunos/start.sh"]
