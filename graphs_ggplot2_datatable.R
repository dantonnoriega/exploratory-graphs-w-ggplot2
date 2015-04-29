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

# data tweaks
## variable `date` in econ is a string. strings have no "order" -- considered categories
date2 <- strptime(econ$date, "%F", tz='utc') # create time variable

# GGPLOT2 BASICS: qplot ---------------------------

## qplot objects (good for wide data, quick plotting)
s1 <- qplot(x=date2, y = econ$unemploy, geom = "smooth")
l1 <- qplot(x=date2, y = econ$unemploy, geom = "line")



# GGPLOT2 BASICS: ggplot ---------------------------

## ggplot object (good for categories groups)
# (1) data and (2) aesthetics
g1 <- ggplot(diamonds, aes(x = price, fill = cut))
g1 # error -- needs layers

# (3) layers
g2 <- g1 + geom_bar()
g2

# (4) position
