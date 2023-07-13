## Compare the mass of male and female human star wars characters!
## null hypothesis: average mass pf male and female stars wars characters is the same
##alternative hypothesis: average mass og male and female star wars characters are different

swHumans <- starwars %>% filter(species == "Human", mass > 0)
males <- starwars %>% filter(sex == "male")
females <- starwars %>% filter(sex == "female")

t.test(males$mass, females$mass, paired = F)
# p val = 0.06
#not significant, fail to reject null hypothesis