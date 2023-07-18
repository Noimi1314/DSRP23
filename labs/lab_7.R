## Set up ####
mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)
mm <- na.omit(mm)

library(tidyr)
library(janitor)
library(dplyr)

## Task 1 ####
# null hypothesis: Ages of people under 30 depression = Ages of people over 30 depression 
#Alternative hypothesis:  Ages of people under 30 depression ≠ Ages of people over 30 depression 
# two tailed
# not paired

young <- mm %>% filter(Age <= 30)
young

old <- mm %>% filter(Age >= 31)
old

t.test(young$Depression, old$Depression, paired = F) #alternative = ">" or "<"
#p value = 0.005736

## Task 2 ####
# null hypothesis: Improve effects hours per day = No effect hours per day = Worsen hours per day

anovaResults <- aov(Hours.per.day ~ Music.effects, mm)
anovaResults

summary(anovaResults)

TukeyHSD(anovaResults)

##Task 3 ####
# null hypothesis: Music effects is independent from listening while working
t <- table(mm$Music.effects, mm$While.working)
chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals






