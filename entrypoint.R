#
# Copyright (C) 2024 GeonamesR Package.
#
# GeonamesR Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#
# Load functions
#
pkgload::load_all()

#
# Start plumber (Runnable router)
#
plumber::plumb("./R/plumber.R") |> plumber::pr_run(
  host = "0.0.0.0", 
  port = 5050,
)
