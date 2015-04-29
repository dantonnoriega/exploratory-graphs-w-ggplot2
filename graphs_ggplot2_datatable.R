rm(list=ls()) # clear objects
gc()    # collect garbage (free up ram)

# check for packages; install if missing
packages <- c('ggplot2', 'data.table', 'reshape2')
if(!any(sapply(packages, require, character.only=TRUE))) {
    find <- which(!sapply(packages, require, character.only=TRUE))
    install.packages(packages[find], dependencies=TRUE)
}


library(ggplot2)
library(data.table)
library(reshape2)

# SET UP ------------------------

main_dir <- file.path("/Users/dnoriega/GitHub/SSRI_exploratory_graphs_w_ggplot2/")

# IMPORT DATA (fread) -----------------------

## two files to import: econ.csv and mpg.csv
econ <- fread(file.path(main_dir, "econ.csv"))
diamonds <- fread(file.path(main_dir, "diamonds.csv"))

# GGPLOT2 BASICS ---------------------------

# ggplot
# - requires (1) data and (2) aesthetics
g1 <- ggplot(econ, aes(x = date, y = unemp))