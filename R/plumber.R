#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#* @apiTitle Geonames Rest API

#' plumber functions
#'
#' plumber endpoints
#'
#' @name plumber
#' @import pkgload
#' @import plumber
NULL


#* Echo back the input
#* @param q Query string (Lucene-compatible format)
#* @param size Query string (Lucene-compatible format)
#* @get /geonames
#* @serializer json
function(res, req, q = "", size = 100) {
  size <- as.integer(size)
  
  if (.string_is_empty(q)) {
    # handling invalid string
    res$status <- 400
    
    return(list(message = "Empty string is not allowed",
                code = 400))
  }
  
  if (!.size_is_valid(size)) {
    # handling invalid size
    res$status <- 400
    
    return(list(message = "Size must be a valid integer value (>0 and <=1000)",
                code = 400))
  }
  
  return(search(q, size))
}
