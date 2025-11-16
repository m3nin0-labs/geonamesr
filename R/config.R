#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Get GeonamesR data directory.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @return Path to the GeonamesR data directory.
#'
.get_geonamesr_data_dir <- function() {
  fs::path(Sys.getenv("GEONAMESR_DATA_DIR", ".geonamesr"))
}

#' Get GeonamesR index directory.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @return Path to the GeonamesR index directory.
#'
.get_geonamesr_index_dir <- function() {
  .get_geonamesr_data_dir() / "indexdata"
}

#' Get raw Geonames columns.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @return Path to the GeonamesR index directory.
#'
.get_geonamesr_columns <- function() {
  c(
    "geonameid",
    "name",
    "asciiname",
    "alternatenames",
    "latitude",
    "longitude",
    "feature_class",
    "feature_code",
    "country_code",
    "cc2",
    "admin1_code",
    "admin2_code",
    "admin3_code",
    "admin4_code",
    "population",
    "elevation",
    "dem",
    "timezone",
    "modification_date"
  )
}
