# Use the latest Ubuntu devcontainer release
ARG UBUNTU_VERSION=noble
FROM mcr.microsoft.com/devcontainers/base:${UBUNTU_VERSION}

# Get full LaTeX with texlive installed with the normal packaged apt-get installation process
# After that the cache is purged to save image space
RUN apt-get update && apt-get -y install \
    lsb-release \
    curl \
    tzdata \
    texlive-full \
    inkscape \
    make && \
    apt-get purge -y *-doc && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# Display distribution specific information
RUN lsb_release -a
