library(tidymodels)

salary_data

noNAs <- na.omit(salary_data)
noNAs <- filter(salary_data, !is.na(Age), !is.na(Years.of.Experience))

# replace with means
replaceWithMeans <- mutate(salary_data,
                           Age = ifelse(is.na(Age),
                                         mean(Age),
                                         Age))

intSalary <- mutate(salary_data, Job.Title = as.integer(as.factor(Job.Title)), Education.Level = as.integer(as.factor(Education.Level)), Gender = as.integer(as.factor(Gender)))
intSalary

## Step 3: Visualize Data
# Make a PCA
#Calculate Correlations

library(reshape2)
library(ggplot2)

salaryCors <- intSalary |>
  cor() |>
  melt() |>
  as.data.frame()
salaryCors

ggplot(salaryCors, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "red", high = "blue", mid = "white",
                       midpoint = 0)

# high correlation?

ggplot(intSalary, aes(x = Years.of.Experience, y = Age)) +
  geom_point() +
  theme_minimal()

# low correlation?

ggplot(intSalary, aes(x = Age, y = Gender)) +
  geom_point() +
  theme_minimal()



library(rsample)

# Set seed for reproducability
set.seed(71823)

## Put 75% of data into the training set
## Regression dataset splits
# Create a split
reg_split <- initial_split(intSalary, prop = .75)

# Use the split to form testing and training sets
reg_train <- training(reg_split)
reg_test <- testing(reg_split)
reg_test

## Steps 6 and 7: Choose a ML model an md then train it
library(parsnip)

# Linear Regression

lm_fit <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression") |>
  fit(Age ~ Years.of.Experience + Education.Level + Salary + Job.Title + Gender,
      data = reg_train)

## Sepal.Length = 2.3 + Petal.Length*0.7967 + Petal.Width*-0.4067 + Species*-0.3312 + Sepal.Width*0.5501

lm_fit$fit
summary(lm_fit$fit)

## Boosted Decision Trees
library(xgboost)
boost_reg_fit <- boost_tree() |>
  set_engine("xgboost") |>
  set_mode("regression") |>
  fit(Age ~ ., data = reg_train)

boost_reg_fit$fit$evaluation_log


library(ranger)


## Step 8: Evaluate Model Performance on Test set
# Calculate errors for regression
library(yardstick)
#lm_fit, boost_reg_fit, forest_reg_fit
reg_results <- reg_test

reg_results$lm_pred <- predict(lm_fit, reg_test)$.pred
reg_results$boost_pred <- predict(boost_reg_fit, reg_test)$.pred

yardstick::mae(reg_results, Age, lm_pred)
yardstick::mae(reg_results, Age, boost_pred)

yardstick::rmse(reg_results, Age, lm_pred)
yardstick::rmse(reg_results, Age, boost_pred)