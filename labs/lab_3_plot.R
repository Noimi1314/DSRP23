mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)
library(ggplot2)

#numeric
age <- na.omit(mm$Age)
#categorical
work <- na.omit(mm$While.working)

#one numeric variable
ggplot(data = mm, aes(x = age)) +
geom_boxplot()

#one numeric and categorical
ggplot(data = mm, aes(x = While.working, y = Age)) +
  geom_jitter(width = 0.2, aes(color = While.working)) +
  labs(x = "Listening to music while working")

#two numeric 
ggplot(data = mm, aes(x = Hours.per.day, y = Age)) +
  geom_violin(aes(fill = "pink")) +
  labs(x= "Listening hours per day")
