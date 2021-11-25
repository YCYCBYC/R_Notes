#### Note 07 Week 03 Exploratory Data Analysis ####'


#### Hierarchical Clustering ####


## example
#set.seed(99)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = 'blue', pch = 20)
text(x+0.05, y+0.05, labels = as.character(1:12))


dataframe <- data.frame(x, y)
kmeansObj <- kmeans(dataframe, centers = 3)
names(kmeansObj)
kmeansObj$cluster
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)


## hclust
dataframe <- data.frame(x = x, y = y)
distxy <- dist(dataframe)
hclustering <- hclust(distxy)
plot(hclustering)


## Dimension Reduction
par(mar = rep(0.2,4))
datamatrix <- matrix(rnorm(400), nrow = 40)

image(1:10, 1:40, t(datamatrix)[, nrow(datamatrix):1])
heatmap(datamatrix)


for(i in 1:40) {
    coinflip <- rbinom(1, 1, 0.5)
    if(coinflip) {
        datamatrix[i, ] <- datamatrix[i, ] + rep(c(0,4), each = 5)
    }
}
image(1:10, 1:40, t(datamatrix)[, nrow(datamatrix):1])
heatmap(datamatrix)


## polt dots
dev.off()
par(mfrow = c(1,3))
image(1:10, 1:40, t(datamatrix)[, nrow(datamatrix):1])

svd1 <- svd(scale(datamatrix))
plot(svd1$u[,1], 40:1, xlab = "row", ylab = "First left singular vctor", pch = 20)
plot(svd1$v[,1], xlab = "column", ylab = "First right singular vctor", pch = 20)


## missing values





