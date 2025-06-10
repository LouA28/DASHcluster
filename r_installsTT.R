# Use available cores minus 2
options(Ncpus = parallel::detectCores() - 2)

# Define list of packages you want to install
packages <- c(
  "arrow", "BH", "BiocManager", "brms", "cli", "cowplot", "crosstalk", "data.table", "devtools",
  "dplyr", "DT", "formattable", "gamm4", "gdalBindings", "ggnewscale", "ggplot2", "ggrepel",
  "glmmTMB", "gratia", "GT", "here", "htmltools", "htmlwidgets", "janitor", "kableExtra",
  "lattice", "lazyeval", "leaflet", "lubridate", "mgcv", "nanoparquet", "nimble", "odbc",
  "openxlsx", "packrat", "plotly", "png", "profvis", "purrr", "qgam", "raster", "Rcpp", "renv",
  "readr", "readxl", "reticulate", "rlang", "RPostgres", "rsconnect", "rstudioapi", "scales", "sf",
  "shiny", "shinyBS", "shinycssloaders", "shinydashboard", "shinyjs", "slickR", "snakecase",
  "srvyr", "stringr", "svglite", "tidyr", "tidyverse", "tictoc", "tmap", "treemap", "treemapify",
  "viridis", "visNetwork", "writexl", "zoo", "corrplot", "DHARMa", "gclus", "GGally", "gstat",
  "lme4", "multcomp", "naniar", "ordbetareg", "performance", "pscl", "psych", "reshape", "rgl",
  "rnaturalearth", "vegan", "visdat", "connectapi", "gllvm", "brickster"
)

# Remove already installed packages from the install list
to_install <- setdiff(packages, rownames(installed.packages()))

# Install remaining packages
if (length(to_install) > 0) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
}

