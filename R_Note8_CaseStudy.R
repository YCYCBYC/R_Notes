#### R_Note8_CaseStudy ####

dim(pm0)
head(pm0)
names(pm0)
table(pm0)

cnames <- list("# RD|Action Code|State Code|County Code|Site ID|Parameter|POC|
               Sample Duration|Unit|Method|Date|Start Time|Sample Value|
               Null Data Code|Sampling Frequency|Monitor Protocol (MP) ID|
               Qualifier - 1|Qualifier - 2|Qualifier - 3|Qualifier - 4|
               Qualifier - 5|Qualifier - 6|Qualifier - 7|Qualifier - 8|
               Qualifier - 9|Qualifier - 10|
               Alternate Method Detectable Limit|Uncertainty")
cnames <- strsplit(cnames, "|", fixed = TRUE)
names(pm0) <- make.names(cnames[[1]][wcol])


x0 <- pm0$Sample.Value  # missing value
mean(is.na(x0))  # percentage of missing value

summary(x0)
boxplot(log10(x0), log10(x1))

negative <- x1 < 0
sum(negative, na.rm = TRUE)
mean(negative, na.rm = TRUE)

dates <- pm1$Date
dates <- as.Date(as.character(dates), '%Y%m%d')



