library(ggplot2)
library(tidyr)
library(janitor)
library(dplyr)

health_insurance <- read.csv("data/insurance.csv")
health_insurance

## t-test

males <- filter(health_insurance, sex == "male")
females <- filter(health_insurance, sex == "female")
nineteen <- filter(health_insurance, age == 19)
twentythree <- filter(health_insurance, age == 23)
sixty <- filter(health_insurance, age == 60)

t.test(males$charges, females$charges, alternative = "two.sided")
t.test(nineteen$charges, twentythree$charges)

## anova

head(health_insurance)

anova_insurance <- aov(data = health_insurance, charges ~ region)
summary(anova_insurance)

TukeyHSD(anova_insurance)

## chi square test

t2 <- table(health_insurance$region, health_insurance$smoker)

chi <- chisq.test(t2)
chi$p.value
chi$residuals

corrplot(chi$residuals, is.cor = F)