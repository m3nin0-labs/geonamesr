#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Read geonames file by chunks.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @param geonames_file Path to the Geonames raw CSV
#' @param callback Callback function used to process the data chunks. This
#'                 callback receives two parameters (data and index).
#'
#' @note [readr::read_delim_chunked] is used to process the data. To learn more
#' check its documentation.
.geonames_read_by_chunks <- function(geonames_file, callback) {
  readr::read_delim_chunked(
    geonames_file,
    callback,
    delim = "\t",
    col_names = F,
    guess_max = 0
  )
}
