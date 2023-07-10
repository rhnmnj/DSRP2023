number <- 5
decimal <- 1.5

letter <- "a"
word <- "hello"

logic <- TRUE
logic2 <- F

ls()

class(logic)
class(word)
class(number)
class(decimal)
typeof(number)
typeof(decimal)

##we can change the type of an object

as.character(number)
round(decimal)
floor(decimal)
ceiling(decimal)
?round
?floor
round(22/7, 3)
22/7
round(22/7, 69420)
as.integer("hello")

name <- "Sarah"
NAME <- "Joe"

paste("Programming", "with", "R", sep="_")
?grep

seq(1, 5, 0.5)
rep(1, 3)

seq(1, 20)

numbers <- 1:20
five_nums <- sample(numbers, 5)
five_nums <- sort(sample)
rev(five_nums)
View(mtcars)

iris[1:5, 1]
View(iris)
iris
mean(iris$Sepal.Length)
median(iris$Sepal.Length)

max(iris$Sepal.Length) - min(iris$Sepal.Length)


getwd()
super_data <- read.csv("data/super_hero_powers.csv")

View(super_data)
glimpse()
?glimpse()
?str()
str(super_data)
play_data <- read.csv("data/googleplaystore.csv")
play_data
View(play_data)

mean(play_data$Price)

predictioncsv <- read.csv("data/prediction.csv")
predictioncsv

mean(predictioncsv$area)
median(predictioncsv$area)
max(predictioncsv$area) - min(predictioncsv$area)

var(predictioncsv$area)
sd(predictioncsv$area)
IQR(predictioncsv$area)
table(predictioncsv$area)
plot(predictioncsv$area)
sort(predictioncsv$area)
plot(mean(predictioncsv$area))

res<-quantile(predictioncsv$area, probs = c(0,0.25,0.5,0.75,1))
res
Q3 <- quantile(predictioncsv$area, probs = 0.75)
Q3
Q1 <- quantile(predictioncsv$area, probs = 0.25)
Q1

highoutlier <- Q3 + (1.5*(IQR(predictioncsv$area)))
lowoutlier <- Q1 - (1.5*(IQR(predictioncsv$area)))


mean(predictioncsv$area) - 3*sd(predictioncsv$area)
higher
IQR(predictioncsv$area)

highoutlier
lowoutlier
Q1
Q3
data_no_outlier <- subset(predictioncsv$area, predictioncsv$area > lowoutlier & predictioncsv$area < highoutlier)
table(data_no_outlier)
length(data_no_outlier)

predictioncsv$area[predictioncsv$area < lowoutlier]
predictioncsv$area[predictioncsv$area > highoutlier]

predictioncsv[predictioncsv$area < Q1]
predictioncsv[predictioncsv$area > Q3]

removed_outliers <- predictioncsv$area[predictioncsv$area > Q1 & predictioncsv$area < Q3]
mean(removed_outliers)
median(removed_outliers)
