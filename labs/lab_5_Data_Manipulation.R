#set up
mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)
library(ggplot2)

#filter the observations of your dataset 
#based on one or more variable using filter()
filter(mm, Music.effects == "Improve")

#create a smaller dataset with a subset of variables using select()
select(mm, Age, Hours.per.day, Depression)

#add 2 new columns to your dataset using mutate()
mm_small <- select(mm, Age, Hours.per.day, Depression, Music.effects)

mutate(mm_small,
       age_hours = Age/Hours.per.day,
       Depression_percent = Depression*10,
       by. = Age)

#create a data table of grouped summaries 
#on at least one numeric variable by at least one categorical variable using summarize()
summarise(mm_small, 
          med_Dep = median(Depression, na.rm = T), 
          .by = Age)

#reorder a data table of your choice by one or more variables using arrange()
arrange(mm, desc(Age), .by = Age)

#visualization
newmm = select(mm, Age, Hours.per.day, Depression, Music.effects)
ggplot(data = mm_small, aes(x = Age, y = Hours.per.day)) +
  geom_point()








