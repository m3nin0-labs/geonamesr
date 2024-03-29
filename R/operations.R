#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Index Geonames data.
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @param geonames_file Path to the Geonames raw CSV.
#'
#' @description
#' This function indexes the raw data (in CSV format) extracted from 
#' Geonames into a Lucene++ index.
#'
#' @references
#' GeoNames. GeoNames. http://geonames.org/. Retr. February 11, 2024
#'
#' @note To learn more about the Geonames data, please use the following link:
#'       https://download.geonames.org/export/dump/readme.txt
#'       
#' @note To download the data, please access the Geonames website:
#'       https://download.geonames.org/export/dump/
#'
#' @export
index <- function(geonames_file) {
  if (!.fs_check_file(geonames_file)) {
    .error("Invalid Geonames data file.")
  }
  
  # Preparing data directory
  .fs_create_dir(.get_geonamesr_data_dir())
  
  # Indexing all content by chunks
  .geonames_read_by_chunks(geonames_file, function(row, idx) {
    names(row) <- .get_geonamesr_columns()
    
    geonames <-
      lapply(split(row, seq(nrow(row))), function(rowMutate) {
        rowMutate$geometry <-
          paste(rowMutate["longitude"], rowMutate["latitude"], sep = ",")
        
        rowMutate
      })
    
    geonames_index_result <-
      try(.indexBulk(geonames, .get_geonamesr_index_dir()))
    
    list(idx = idx,
         error = ifelse(
           geonames_index_result == Inf,
           FALSE,
           all(geonames_index_result)
         ))
  })
}

#' Search Geonames data.
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @param text Query text
#' @param max_items Max number of files to return as result.
#'
#' @description
#' This function searches content across all Geonames data indexed locally.
#'
#' @references
#' GeoNames. GeoNames. http://geonames.org/. Retr. February 11, 2024
#'
#' @note To use this function, you must have a local Geonames index. To learn
#'       more, please check [geonamesr::index].
#'       
#' @note To learn more about the query syntax, please check the Lucene core 
#'       documentation (https://lucene.apache.org/core/9_9_2/index.html).
#'
#' @export
#' 
#' @return Search result items. 
search <- function(text, max_items = 100) {
  index_dir <- .get_geonamesr_index_dir()
  
  if (!.fs_check_dir(index_dir)) {
    .error("Index not found. Create it using `geonamesr::index`.")
  }
  
  if (.string_is_empty(text)) {
    .error("Empty string is not allowed!")
  }
  
  .search(text, max_items, index_dir)
}
