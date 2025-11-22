
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geonamesr 🌎🔍

`geonamesr` is an R package developed using
[Rcpp](https://www.rcpp.org/), integrated with the [Lucene++
project](https://github.com/luceneplusplus/LucenePlusPlus), designed to
allow users to index and search data from
[Geonames](http://www.geonames.org/) locally. This package contains not
only R functions as a standard package but also provides a
[Plumber](https://www.rplumber.io/) REST API, making data more
accessible and discoverable for R users.

> **Note**: This is a **hobby project** created to learn more about
> [Rcpp](https://www.rcpp.org/) and [Plumber](https://www.rplumber.io/).

## Installation

You can install the development version of `geonamesr` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("M3nin0/geonamesr")
```

> You must have the
> [Lucene++](https://github.com/luceneplusplus/LucenePlusPlus) installed
> in your environment. To learn more, check the [Lucene++ build
> documentation](https://github.com/luceneplusplus/LucenePlusPlus).

## Docker

For ease of use, `geonamesr` is also available as a Docker container.
The provided Dockerfile simplifies deployment, and a docker-compose file
is available for quick setup.

### Running with Docker

``` bash
docker-compose up -d
```

This command starts the `geonamesr` service, making it accessible via
the plumber REST API at the `/geonames` route.

# Usage

Below is a basic example of how to use `geonamesr` to index and search
Geonames data.

``` r
library(geonamesr)

# Indexing data
index("allCountries.txt")

# Searching indexed data
search("asciiname:switzerland", max_items = 1)
```

## Accessing the REST API

The plumber REST API exposes the `/geonames` route for searching indexed
data.

**Search Endpoint:** `http://localhost:5050/geonames?q=<search-query>`

## OpenAPI Documentation

The OpenAPI documentation is available under the `/__docs__` route,
providing detailed information about the API endpoints, parameters, and
responses.
