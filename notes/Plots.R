install.packages("ggplot2")

library(ggplot2)

?ggplot2

str(mpg)

ggplot(data = mpg, aes(x = hwy, y = cty)) +
  geom_point() +
  labs(x = "highway mpg",
       y = "city mpg",
       title = "cary city vs highway milage")
ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram()

ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.25)

ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_density()

ggplot(data = iris, aes(x = Sepal.Length, y = Species)) +
  geom_violin(color = "violet", fill = "pink") +
  geom_boxplot(fill = "red")

ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_bar(stat = "summary",
           fun = "mean")

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_jitter(width = 0.2)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_line() +
  theme_void()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  scale_color_manual(values = c("violet", "lightpink", "red"))

View(iris)
