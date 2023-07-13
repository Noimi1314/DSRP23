## Set up ####
mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)

library(tidyr)
library(janitor)
library(dplyr)

## Task 1 ####
# null hypothesis: Ages of people under 30 depression = Ages of people over 30 depression 
# two tailed
# not paired

young <- mm %>% filter(Age <= 30)
young

old <- mm %>% filter(Age >= 31)
old

t.test(young$Depression, old$Depression, paired = F)
#p value = 0.005736