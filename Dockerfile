FROM bioconductor/bioconductor_docker:RELEASE_3_19

ARG QUARTO_VERSION=1.8.27

# Install Quarto, Git, qpdf
RUN wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ./quarto-${QUARTO_VERSION}-linux-amd64.deb \
    git \
    qpdf \
  && rm quarto-${QUARTO_VERSION}-linux-amd64.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install R-packages
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

WORKDIR /data
CMD ["/bin/bash"]