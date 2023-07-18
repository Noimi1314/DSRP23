## Compare the mass of male and female human star wars characters!
## null hypothesis: average mass pf male and female stars wars characters is the same
##alternative hypothesis: average mass og male and female star wars characters are different
library(tidyr)
library(janitor)
library(dplyr)

swHumans <- starwars %>% filter(species == "Human", mass > 0)
males <- starwars %>% filter(sex == "male")
females <- starwars %>% filter(sex == "female")

t.test(males$mass, females$mass, paired = F)
# p val = 0.06
#not significant, fail to reject null hypothesis

## ANOVA ####
iris

anovaResults <- aov(data = iris, Sepal.Length ~ Species)
anovaResults

## Are any groupa different from each other?
summary(anovaResults)

## Which ones?
TukeyHSD(anovaResults)
#diff = difference of mean
#lwr and upr = in between upper and lower
#p adj = p value sometimes so small that they end up at 0 



## Is there a significant difference in the mean petal lenghts or petal widths by species?
anovaLength <- aov(Petal.Length ~ Species, iris)
anovaLength

## Are any groupa different from each other?
summary(anovaLength)

## Which ones?
TukeyHSD(anovaLength)



### Starwars
head(starwars)
unique(starwars$species)

## Which 5 species are the most common
top3species <- starwars %>% 
  summarise(.by = species, 
            count = sum(!is.na(species))) %>% 
  slice_max(count, n = 3)
top3species

starwars_top3species <- starwars %>% 
  filter(species %in% top3species$species)

starwars_top3species

# Is there a significant difference in the mass of each of the top 3 species?
a <- aov(mass ~ species, starwars_top3species)
summary(a)
TukeyHSD(a)

#height
a <- aov(height ~ species, starwars_top3species)
summary(a)
TukeyHSD(a)


## Chi-Squared ####
starwars_clean <- starwars %>% 
  filter(!is.na(species),
         !is.na(homeworld))

t <- table(starwars_clean$species, starwars_clean$homeworld) #give two categories
chisq.test(t) #not enough data

mpg
table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

## How do we get a contingency table of year and drv?
t <- table(mpg$year, mpg$drv)
chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals

install.packages("cornplot")
library(cornplot)

cornplot(chisq_result$residuals)

## chi-squared full analysis
heroes <- read.csv("~/Downloads/heroes_information.csv")
View(heroes)
head(heroes)

## clean data
heroes_clean <- heroes %>% 
  filter(Alignment != "-",
         Gender != "-")

## plot the counts of alignment and genderr
ggplot(heroes_clean, aes(x = Gender, y = Alignment)) +
  geom_count() +
  theme_minimal()

## make contingency table
t <- table(heroes_clean$Alignment, heroes_clean$Gender)
t

## chi squared test
chi <- chisq.test(t)
chi$p.value
chi$residuals

