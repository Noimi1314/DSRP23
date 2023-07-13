## install required packages
install.packages("janitor")
install.packages("tidyr")

##load required packages
library(tidyr)
library(janitor)
library(dplyr)

## clean_names()
starwars
clean_names(starwars, case = "small_camel")
clean_names(starwars, case = "screaming_snake")
new_starwars <- clean_names(starwars, case = "upper_lower")

clean_names(new_starwars)

new_starwars <- rename(new_starwars, `hair*color` =  HAIR_COLOR)
clean_names(new_starwars)

## make a table of names and species of all female characters by age
#way 1
StarWarsWomen <- select(arrange(filter(starwars, sex == "female"), birth_year), name, species)

#way 2
#can use command f to replace words
StarWarsWomen <- filter(starwars, sex == "female")
StarWarsWomen <- arrange(StarWarsWomen, birth_year)
StarWarsWomen <- select(StarWarsWomen, name, species)

#way 3 (best)
#output of one pipe becomes input of next using "|>" or " %>% "(shift command m)
StarWarsWomen <- starwars %>% 
  filter (sex=="female") %>% 
  arrange(birth_year) %>% 
  select(name, species)

## slice_x()
#10 tallest
slice_max(starwars, n = 10)

#Tallest of each species
slice_max(starwars, height, n = 1, by = species)

slice_max(starwars, height, n = 1, by = species, with_ties = F)

## Tidy data ####
table4a
#pivot longer
tidy_table4a <- pivot_longer(table4a,
                             cols = c(`1999`, `2000`),
                             names_to = "year",
                             values_to = "cases")
table4b # shows population data
## How would we pivot table4b to be in "tidy" format

tidy_table4b <- pivot_longer(table4b,
                            cols = c(`1999`, `2000`),
                            names_to = "year",
                            values_to = "population")


## pivot wider 
table2

pivot_wider(table2, 
            names_from = type,
            values_from = count)

## seperate
table3

separate(table3,
         rate,
         into = c("cases", "population"),
         sep = "/") # what is seperated
##unite
table5

tidy_table5 <- unite(table5,
      "year",
      c("century", "year"),
      sep = "")

tidy_table5 <- table5 %>% 
  unite("year",
        c("century", "year"),
        sep = "" ) %>% 
  separate(rate,
           into = c("cases", "population"),
           sep = "/")

## bind rows
new_data <- data.frame(country = "USA", year = "1999", cases = "1042", population = "2000000")

bind_rows(tidy_table5, new_data)
