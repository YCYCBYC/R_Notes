#### Exploratory Data Analysis WEEK 1 ####




#### The Base Plotting System #### plot, hist, boxplot
## Original plot system
## cannot go back after started

## pch : plotting symbol
## lty : line type
## lwd : line with
## col : plotting color
## xlab, ylab : axis label
## main, sub : title for the plot


library(datasets)
data(cars)
with(cars, plot(speed, dist))

data(airquality)
hist(airquality$Ozone)

with(airquality,plot(Wind, Ozone))
model <- lm(Ozone ~ Wind, airquality)
abline(model, Wind, lwd = 2)

boxplot(Ozone ~ Month, airquality, xlab = 'Month', ylab = 'Ozone (ppb)')

## case study ##
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x,y)
par(mar = c(4,2,4,2))
plot(x,y, pch = 20)
title('Cheng Plot')
text(-2, -2, 'TEXT')
fit <- lm(y~x)
abline(fit, lwd = 2, col = 'blue')

## location
z <- rpois(100,2)
par(mfrow = c(2,2))
plot(x,y)
plot(x,z)
plot(y,z)
plot(z,y)





#### The Lattice System ####
## Created with a single function 
## Things are set automatically
## Cannot add anything after started




#### ggplot2 System ####
## Easier
## Default mode makes many choices for the user
## Mix of base and lattice

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
qplot(speed, dist, data = cars)













