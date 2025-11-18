#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' Create directory.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@@gmail.com}
#'
#' @return Path to the created directory.
.fs_create_dir <- function(directory) {
  if (!fs::dir_exists(directory)) {
    fs::dir_create(directory)
  }
  
  directory
}

#' Check if a given file exists.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@@gmail.com}
#'
#' @return Boolean indicating if the given file exists or not.
.fs_check_file <- function(file) {
  fs::file_exists(file)
}

#' Check if a given file exists.
#' @noRd
#'
#' @author Felipe Carlos, \email{efelipecarlos@@gmail.com}
#'
#' @return Boolean indicating if the given dir exists or not.
.fs_check_dir <- function(dir) {
  fs::dir_exists(dir)
}
