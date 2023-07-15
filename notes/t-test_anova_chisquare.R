## Notes ####
anova_test <- aov(data = health_insurance, bmi ~ smoker)
summary(anova_test)

TukeyHSD(anova_test)

## ANOVA ####
iris

anova_results <- aov(data = iris, Sepal.Length ~ Species)
anova_results

## Is there a significant difference in the mean petal lengths or petal width by species?

iris

anova_iris <- aov(data = iris, Petal.Length ~ Species)
anova_iris

summary(anova_iris)

TukeyHSD(anova_iris)



## Which five species are the most common

top3species <- starwars |>
  summarize(.by = species,
            count = sum(!is.na(species))) |>
  slice_max(count, n = 3)
top3species

starwars_top3species <- starwars |>
  filter(species %in% top3species$species)

a <- aov(height ~ species, starwars_top3species)
summary(a)
TukeyHSD(a)


## Chi-Squared ####

table(starwars$species, starwars$homeworld)

View(table(starwars$species, starwars$homeworld))

table(mpg$cyl, mpg$displ)

#t <- table(mpg$year, mpg$drv)

chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals

install.packages("corrplot")
library(corrplot)

corrplot(chisq_result$residuals)



## chi-squared full analysis
heroes <- read.csv("data/heroes_information.csv")
head(heroes)


## clean data

heroes_clean <- heroes |>
  filter(Alignment != "-",
         Gender != "-")

## plot the counts of alignment and gender
ggplot(heroes_clean, aes(x = Gender, y = Alignment)) +
  geom_count() +
  theme_minimal()

t1 <- table(heroes_clean$Alignment, heroes_clean$Gender)

## chi squared test
chi <- chisq.test(t1)
chi$p.value
chi$residuals

corrplot(chi$residuals, is.cor = F)