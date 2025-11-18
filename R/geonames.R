#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Read geonames file by chunks.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@@gmail.com}
#'
#' @param geonames_file Path to the Geonames raw CSV
#' @param callback Callback function used to process the data chunks. This
#'                 callback receives two parameters (data and index).
#' @param chunk_size Number of rows to read per chunk. Default is 10000.
#'
#' @note [readr::read_delim_chunked] is used to process the data. To learn more
#' check its documentation.
.geonames_read_by_chunks <- function(geonames_file, callback, chunk_size = 10000) {
  readr::read_delim_chunked(
    geonames_file,
    callback,
    delim = "\t",
    col_names = FALSE,
    guess_max = 0,
    chunk_size = chunk_size,
    progress = TRUE
  )
}
