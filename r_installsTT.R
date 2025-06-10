# Use available cores minus 2
options(Ncpus = parallel::detectCores() - 2)

# Step 1: Ensure Rcpp is installed first
if (!"Rcpp" %in% rownames(installed.packages())) {
  install.packages("Rcpp", repos = "https://cloud.r-project.org")
}

# Install spatial dependencies first
spatial_packages <- c("sp", "sf", "terra", "raster")
to_install_spatial <- setdiff(spatial_packages, rownames(installed.packages()))
if (length(to_install_spatial)) {
  install.packages(to_install_spatial, repos = "https://cloud.r-project.org")
}

# Check and install leaflet afterwards
if (!"leaflet" %in% rownames(installed.packages())) {
  install.packages("leaflet", repos = "https://cloud.r-project.org")
}

# Step 2: Define list of packages to install (excluding Rcpp)
packages <- c(
  "arrow", "BH", "BiocManager", "brms", "cli", "cowplot", "crosstalk", "data.table", "devtools",
  "dplyr", "DT", "formattable", "gamm4", "gdalBindings", "ggnewscale", "ggplot2", "ggrepel",
  "glmmTMB", "gratia", "GT", "here", "htmltools", "htmlwidgets", "janitor", "kableExtra",
  "lattice", "lazyeval", "lubridate", "mgcv", "nanoparquet", "nimble", "odbc",
  "openxlsx", "packrat", "plotly", "png", "profvis", "purrr", "qgam", "raster", "renv",
  "readr", "readxl", "reticulate", "rlang", "RPostgres", "rsconnect", "rstudioapi", "scales",
  "shiny", "shinyBS", "shinycssloaders", "shinydashboard", "shinyjs", "slickR", "snakecase",
  "srvyr", "stringr", "svglite", "tidyr", "tidyverse", "tictoc", "tmap", "treemap", "treemapify",
  "viridis", "visNetwork", "writexl", "zoo", "corrplot", "DHARMa", "gclus", "GGally", "gstat",
  "lme4", "multcomp", "naniar", "ordbetareg", "performance", "pscl", "psych", "reshape", "rgl",
  "rnaturalearth", "vegan", "visdat", "connectapi", "gllvm", "brickster"
)

# Step 3: Remove already installed packages from the list
to_install <- setdiff(packages, rownames(installed.packages()))

# Step 4: Install remaining packages
if (length(to_install) > 0) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
}
