#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Check if a string is empty.
#' @noRd
#'
#' @param text String to be checked.
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @return Boolean flag indicating if the given string is empty.
#'
.string_is_empty = function(text) {
  stringr::str_length(stringr::str_trim(text)) == 0
}

#' Check if a size is valid.
#' @noRd
#'
#' @param integer Integer to be checked
#'
#' @author Felipe Carlos, \email{efelipecarlos@gmail.com}
#'
#' @return Boolean flag indicating if the given size is valid.
#'
.size_is_valid = function(size) {
  !is.null(size) && size > 0 && size <= 1000
}
