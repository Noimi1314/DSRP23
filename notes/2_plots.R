install.packages("ggplot2") #install required packages
install.packages(c("usethis", "credentials"))
##load required packages

library(ggplot2)

?ggplot2
## mpg dataset
str(mpg)

#scatter plot ####
ggplot(data = mpg, aes(x = hwy, y = cty)) +
  geom_point()+
  labs(x="highway mpg",
       y= "city mpg",
       title = "car city v.s highway milage")

#histogram ####
#one numeric
ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram(bins = 30) #default num of bins is 30

# iris histogram. data = dataset, x = what column to use
# we can set the size of bars with 'bins'
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.25) 

## Density Plot #### 
#one numeric
ggplot(data = iris, aes(x = Sepal.Length,  y = after_stat(count))) +
  geom_density()

# boxplot ####
#one numeric
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_boxplot()

ggplot(data = iris, aes(x = Sepal.Length, y = Species)) +
  geom_boxplot()

#Violin Plot and box plot ####
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(color = "violet", fill = "pink") + 
  geom_boxplot(width = 0.2, fill = NA) +
  labs(title = "Distribution of Iris Sepal Lengths by species")

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(aes(fill = Species)) + 
  geom_boxplot(width = 0.2) 
  

#bar plot #### 
#numeric and categorical data
ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_bar(stat = "summary",
               fun = "mean")
# scatter ####
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()  #2 numeric
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_point() #with category

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_jitter(width = 0.2) #spread above out

## line plot ####
#two numeric
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()+
  geom_smooth(se = F) +
  theme_minimal()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_line(stat = "summary",
            fun = "mean")

## color scales
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  scale_color_manual(values = c("violet", "lightpink", "red"))

##factors
mpg$year <- as.factor(mpg$year)

iris$Species <- factor(iris$Species, levels = c("versicolor", "setosa", "virginica"))





