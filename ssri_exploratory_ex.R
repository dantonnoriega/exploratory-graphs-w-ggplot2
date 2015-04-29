main_dir <- "~/Desktop/ssri"

# INSTALL PACKAGES

install.packages(c('grid', 'gridExtra'), dep=TRUE)
library(grid)
library(gridExtra)
library(ggplot2)
library(data.table)

# IMPORT DATA ----------

econ <- fread(file.path(main_dir, "econ.csv"))
diamonds <- fread(file.path(main_dir, "diamonds.csv"))

date2 <- strptime(econ$date, "%F")


## GGPLOT2: qplot --------------

# qplot -- 'quick plot' (this good for wide data and basic fast plotting)
l1 <- qplot(x = date2, y = econ$unemploy, geom = "line")
s1 <- qplot(x = date2, y = econ$unemploy, geom = "smooth")
h1 <- qplot(x = diamonds$price, geom = "bar")


# GGPLOT2: ggplot ---------------------

# ggplot -- main graphic object
# (1) data (2) aesthetic
g1 <- ggplot(data =  diamonds, aes(x = price, fill = cut))
# (3) layer (geom)
g2 <- g1 + geom_bar()
# (4) position
g3 <- g1 + geom_bar(position = 'dodge')

g5 <- ggplot() + geom_bar(data = diamonds, aes(x = price, fill = color))

## GRID ARRANGE
# take g3 and g5 and put them into one picture
a1 <- grid.arrange(g3, g5)

## AUTOMATIC EXPORT

# want a separate price histogram for each diamond 'cut' exported automatically

grp = unique(diamonds$cut)

for(i in grp) {

    # 1 initialize graphics object and automatic file name
    png(file.path(main_dir, paste0(i, '.png')))
    # 2 set up graphics object
    q <- qplot(x = diamonds[cut == i]$price, xlim = c(0,10000))
    # 3 print graphic object
    print(q)
    # 4 close graphic
    dev.off()

}

# further reading, look at the outline

