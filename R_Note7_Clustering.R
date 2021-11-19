#### Note 07 Week 03 Exploratory Data Analysis ####'


#### Hierarchical Clustering ####


## example
set.seed(99)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = 'blue', pch = 20)
text(x+0.05, y+0.05, labels = as.character(1:12))


## hclust
dataframe <- data.frame(x = x, y = y)
distxy <- dist(dataframe)
hclustering <- hclust(distxy)
plot(hclustering)















