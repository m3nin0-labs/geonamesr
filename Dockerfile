#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Metadata label
LABEL maintainer="Felipe Carlos <efelipecarlos@gmail.com>" \
      org.opencontainers.image.title="geonamesr" \
      org.opencontainers.image.description="Utility package to index and search Geonames data in R" \
      org.opencontainers.image.version="1.0" \
      org.opencontainers.image.license="MIT"

WORKDIR /app

RUN apt update -y \
    && apt install -y \
    && apt install -y \
        git \
        cmake \
        r-base \
        r-cran-devtools \
        r-cran-fs \
        r-cran-pkgload \
        r-cran-plumber \
        r-cran-rcpp \
        r-cran-readr \
        r-cran-stringr \
        liblucene++-dev \
        zlib1g-dev \
        libboost-date-time-dev \
        libboost-filesystem-dev \
        libboost-regex-dev \
        libboost-thread-dev \
        libboost-iostreams-dev \
        libcurl4-openssl-dev \
        libsodium-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/luceneplusplus/LucenePlusPlus.git \
    && cd LucenePlusPlus \
    && mkdir build; cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && make \
    && make install \
    && cd /app \
    && rm -rf LucenePlusPlus

COPY . .

RUN Rscript -e "library(devtools); install()"

CMD [ "entrypoint.R" ]
ENTRYPOINT [ "Rscript" ]
