install.packages("janitor")
install.packages("tidyr")

library(tidyr)
library(janitor)
library(dplyr)

starwars
clean_names(starwars, case = "small_camel")
new_starwars <- clean_names(starwars, case = "screaming_snake")
clean_names(starwars, case = "upper_lower")

new_starwars

clean_names(new_starwars)

new_starwars <- rename(new_starwars, test = HAIR_COLOR)

new_starwars

## using pipes
StarWarsWomen <- starwars |>
  filter(sex == "female") |>
  arrange(birth_year) |>
  select(name, species)

StarWarsWomen

starwars
slice_max(starwars, height, n = 10)
slice_max(starwars, height, n = 2, by=species, with_ties = F)


## tidy data ####
table4a ## shows number of cases
tidytable4a <- pivot_longer(table4a,
                            cols = c(`1999`, `2000`),
                            names_to = "year",
                            values_to = "cases")

table4b ## shows population
tidytable4b <- pivot_longer(table4b,
                            cols = c(`1999`, `2000`),
                            names_to = "year",
                            values_to = "population")

pivot_wider(table2,
            names_from = type,
            values_from = count)

table3

separate(table3,
         rate,
         into = c("cases", "population"),
         sep = "/")

table5
unite(table5,
      "year",
      c("century", "year"),
      sep = "")

t.test(males$mass, females)