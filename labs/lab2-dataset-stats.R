mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)

age <- mm$Age
age <- na.omit(age)
mean(age) # mean
median(age) #median

max(age) - min(age) #range
var(age) #variance

sd(age) #standard deviation

IQR(age) #Interquartile Range

lower <- mean(age) - 3*sd(age) #outliers
upper <- mean(age) + 3*sd(age)

age[age < lower | age > upper] #remove outliers
age <- age[age >= lower & age <= upper] #All the values in between

mean(age) #recalculate mean
median(age) #recalculate median
