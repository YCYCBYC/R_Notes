#### R Note 6 Exploratory Data Analysis ####


#### Lattice Plotting System ####

## xyplot : main function of scatterplots
## xyplot(y ~ x | f * g, data)  # f and g are conditioning variables

## bwplot : boxplot
## histogram : 
## stripplot : like a boxplot but with actual points
## dotplot : plot dots on violin strings
## splom : scatterplot matrix
## levelplot, countourplot : for image data

library(datasets)

library(lattice)

xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

## Lattice Panel Function
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c('Group 1', 'Group 2'))

## simple
xyplot(y ~ x | f, layout = c(2,1))

## add line function
xyplot(y ~ x | f, panel = function(x, y, ...){
    panel.xyplot(x, y, ...)
    panel.abline(h = median(y), lty = 2, lw = 2)
})

## add regression
xyplot(y ~ x | f, panel = function(x, y, ...){
    panel.xyplot(x, y, ...)
    panel.lmline(x, y, lw = 2, col = 2)
})




#### ggplot2 ####

library(datasets)
data(mpg)
str(mpg)

library(ggplot2)

qplot(displ, hwy, data = mpg, color = drv)  # auto generate and lable color

qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'))

g <- qplot(displ, hwy, data = mpg)
g <- g + geom_point(color = 'steelblue', size = 2, alpha = 1/2)
       + geom_smooth(method = 'lm')
g

qplot(hwy, data = mpg, fill = drv)

qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(hwy, data = mpg, facets = drv ~ .)










