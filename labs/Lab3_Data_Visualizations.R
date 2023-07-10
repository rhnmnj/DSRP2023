install.packages("ggplot2")

library(ggplot2)


salary_data <- read.csv("data/Salary_Data.csv")
salary_data
View(salary_data)

ggplot(data = salary_data, aes(x = Age, y = Salary)) +
  geom_point(aes(color = Gender)) +
  scale_color_manual(values = c("red", "blue")) +
  labs(title = "Salary vs Age")  ## Plot 1 - Numeric vs Numeric

ggplot(data = salary_data, aes(x = Education.Level, y = Salary)) +
  geom_violin(fill = "red") +
  labs(title = "Salary vs Educational Level")  ## Plot 2 - Numeric vs Categorical

ggplot(data = salary_data, aes(y = Years.of.Experience)) +
  geom_bar(stat = "count",
                 fun = "mean") +
  labs(title = "Years of Experience")  ## Plot 3 - Distribution of one variable


### TRIALS

ggplot(data = salary_data, aes(x = Job.Title, y = Education.Level)) +
  geom_line()  ## trial 1

ggplot(data = salary_data, aes(x = Gender, y = Years.of.Experience)) +
  geom_count()  ## trial 2
