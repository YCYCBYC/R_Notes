data = read.csv('hw1_data.csv', head = TRUE, sep = ',')

# Question 11: In the dataset provided for this Quiz, what are the column names of the dataset?
head(data, 0)


# Question 12: Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
head(data,2)


#Question 13 How many observations (i.e. rows) are in this data frame?
nrow(data)


#Question 14 Extract the last 2 rows of the data frame and print them to the console. What does the output look like? 
tail(data, 2)


#Question 15 What is the value of Ozone in the 47th row?
data[47, 1]


#Question 16 How many missing values are in the Ozone column of this data frame?
length(which(is.na(data)))

datana <- subset(data, is.na(Ozone))
nrow(datana)


#Question 17 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
datagood <- subset(data, !is.na(Ozone), select = Ozone)
apply(datagood, 2, mean)


#Question 18 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
datasub18 <- subset(data, data$Ozone > 31 & data$Temp > 90, select = Solar.R)
apply(datasub18,2,mean)


#Question 19 What is the mean of "Temp" when "Month" is equal to 6?
datasub19 <- subset(data, data$Month == 6, select = Temp)
apply(datasub19, 2, mean)


#Question 20 What was the maximum ozone value in the month of May (i.e. Month = 5)? 
datasub20 <- subset(data, !is.na(Ozone) & data$Month == 5, select = Ozone)
apply(datasub20, 2, max)
