## types ####
number <- 5
decimal <- 1.5
number
class(number)

logic <- TRUE
class(logic)

word <- "sleep"
class(word)

##rounding ####
ceiling(22/7) #rounds up
floor(22/7) #rounds down

## change types ####
as.integer
word_as_int <- as.integer("hello")
as.integer(1.0)

## NA values ####
NA + 5

## naming ####
name <-"Sarah"
NAME <- "Joe"
n.a.m.e <- "Sam"
n_a_m_e <- "Lisa"

name2 <- "Paul"

## illegal naming characters: ####
# staritng with an underscore
# startinf with a number 
# operators: + - / *
# conditionals: & ! < > !
# others: \ ,

## good naming conventions
camelCase <- "start with a capital letter"
snake_case <- "underscore between words"

## Object manipulation ####
number
number + 7

decimal
number + decimal


name
paste(name, "Parker") #concatenates character vectors
paste0(name, "Parker")

paste(name, number) # can join together characters and numbers
paste0(name, logic)


letter <- "I"

paste(letter, "want to", word)

food <- "watermelon"
grep("me", food) # T or F

## substituting characters in words ####

sub("me", "you", food)
sub("me", "_", food)
sub("me", "", food)

# vectors ####
# make a vector of numerics
numbers <- c(1,2,3,4,5)
rangeOfVals <- 1:5 #ints from 1-5
seq(2,10,2)# from 2 to 10 by 2's
seq(by = 2, from = 2, to = 10) #can put parameters out of order if they are named

rep(3,5) # repeat 3 five times
rep(c(1,2),5) #repeat 1,2 5 times

# how can we get all the values in between 1 and 5 by 0.5?
seq(1, 5, 0.5)

# how can we get [1 1 1 2 2 2]
c(rep(1,3), rep(2,3))
rep(c(1,2), each = 3)


#make a vector of characters
letters <- c("a","b","c")
paste("a","b","c") # paste() is different from c()

letters <- c(letters, "d")
letter
letters <- c(letters, letter)
letters <- c("x", letters, "w")

# make a vector of random number between 1 ans 20
numbers <- 1:20
fiveNums <- sample(numbers, 5) #choose 5 values from the vector numbers
fiveNums
fiveNums <- sort(fiveNums)
rev(fiveNums)

fifteen_nums <- sample(numbers, 5, replace = T)
fifteen_nums <- (fifteen_nums)
length(fifteen_nums) # length of vector
unique(fifteen_nums) # what are the unique values in the vector
# num of unique values
length(unique(fifteen_nums))

table(fifteen_nums) # get the count of values in the vector

fifteen_nums + 5 # adds five to every value in vector
fifteen_nums/2 

nums1 <- c(1,2,3)
nums2 <- c(4,5,6)
nums1 + nums2 #values are just added together element wise

nums3 <- c(nums1, nums2)
nums3 + nums1 # values are recycled to add together no index out of range
nums3 + nums1 + 1

#difference?
sum(nums3 + 1) # adds to every element
sum(nums3) +1 # adds all elements then adds 1

# vector indexing ####
numbers <- rev(numbers)
numbers
numbers[1]
numbers[5]

numbers[c(1,2,3,4,5)]
numbers[1:5]
numbers[c(1,5,2,12)]
i <- 5
numbers[i]

# Datasets ####
?mtcars
mtcars # print entire dataset to console

View(mtcars) # view entire dataset in a new tab

summary(mtcars) # gives us info abt the spread of each variable
str(mtcars) # preview the structure of the dataset

names(mtcars) # names of variables
head(mtcars, 5)# preview the first # of rows, default = 6

## Pull out individual variables as vectors
mpg <- mtcars[,1] #blank means "all". all rows, first column
mtcars[2,2] # value at second row, second column
mtcars[3,] #thrird row, all columns

# first 3 columns
mtcars[,1:3]

# us the the names to pull out columns
mtcars$gear
mtcars[,c("gear", "mpg")] # pull out the gear and mpg columns

sum(mtcars$gear)

# Statistics ####

View(iris)

first5 <- iris$Sepal.Length[1:5]
mean(iris$Sepal.Length)
median(iris$Sepal.Length)

max(first5) - min(first5)
max(iris$Sepal.Length) - min(iris$Sepal.Length) #range

var(first5)
var(iris$Sepal.Length) #variation

sd(first5) # standard deviation(spread, think belle curve)
sd(iris$Sepal.Length)
sqrt(var(first5))

##IQR
IQR(first5) #range of middle 50% of data
quantile(first5, 0.25) # Q1
quantile(first5, 0.75) # Q3

##outliers
lower <- mean(iris$Sepal.Length) - 3*sd(iris$Sepal.Length)
upper <- mean(iris$Sepal.Length) + 3*sd(iris$Sepal.Length)

## subsetting vectors
first5
first5 < 4.75 | first5 > 5
first5[first5 < 4.75]

values <- c(first5, 3, 9)
upper
lower

#removes outliers
values[values < lower | values > upper] #keep values lower than upper and higher than lower

# use to get all values in between outlier
values[values>= lower & values <= upper]

##NA values
NA #unknown
sum(1,2,3,NA) #will return NA

sum(1,2,3,NA,na.rm = T)

mean(c(1,2,3,NA)na.rm = T)

