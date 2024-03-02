#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

FROM rocker/geospatial:4.3.2

WORKDIR /app

RUN apt update -y \
    && apt install -y \
    && apt install \
        git \
        cmake \
        zlib1g-dev \
        libboost-date-time-dev \
        libboost-filesystem-dev \
        libboost-regex-dev \
        libboost-thread-dev \
        libboost-iostreams-dev -y \
    && apt autoclean \
    && apt autoremove

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
