#### R Note4 Simulation & Profiling ####

#### str
## Compactly display the internal structure of an R object,
## a diagnostic function and an alternative to summary

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(10, 2)
summary(f)
str(f)

library(datasets)
head(airquality)
str(airquality)




#### Generating Random Numbers

## rnorm : generate random normal variates
## dnorm : evaluate normal probability density at a point
## pnorm : evaluate the culmulative distribution function for a normal

## d for density
## r for generate
## p for culmulative
## q for quantile function

##generate same random numbers
set.seed(100)
rnorm(10)

rnorm(10)

set.seed(100)
rnorm(10)




#### Generating from a Linear Model

## y = p0 + p1 * x + e
p0 <- 0.5
p1 <- 2
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- p0 + p1 * x + e
summary(y)
plot(x, y)


## Y~ Poisson(mu)
## log(mu) = p0 + p1 * x
p0 <- 0.5
p1 <- 0.3
set.seed(1)
x <- rnorm(100)
log.mu <- p0 + p1 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)




#### Random Sampling
sample(1:10, 4)
sample(1:90, 4)
sample(letters, 4)
sample(letters, 9)




#### R Profiler 

## system.time()
system.time(rnorm(1000))

## Rprof()






