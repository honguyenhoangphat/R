# Thiết lập môi trường
Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANGUAGE = "en")

getwd()
setwd('D:/R-intro/data/')

life <- read.csv("dataset - life expectancy/Life Expectancy Data.csv")
head(life,5)

lifePL <- subset(life, Country=="Poland")

View(lifePL)

lifePLDE <- subset(life, Country=="Poland" | Country=="Germany")
View(lifePLDE)

###
plot(lifePL$Life.expectancy)

plot(x=lifePL$Year, y=lifePL$Life.expectancy)

      ### Line Plot
plot(x=lifePL$Year, y=lifePL$Life.expectancy, type = "l")

      ### Line Plot with Points
plot(x=lifePL$Year, y=lifePL$Life.expectancy, type = "b")

      ### Step Plot 
plot(x=lifePL$Year, y = lifePL$Life.expectancy, type = "s")

# Line Plot with Points
plot(x=lifePL$Year, y=lifePL$Life.expectancy, 
     type = "b", xlim=c(2005, 2010))

# Changing the range of x and y (ZOOM y)
plot(x=lifePL$Year, y=lifePL$Life.expectancy, 
     type = "b", xlim=c(2005, 2010), ylim = c(75, 76.5))

# GDP Plot
plot(lifePL$Year, lifePL$GDP, type='b')

# ADD Information
plot(lifePL$Year, lifePL$GDP, 
     type='b', main='GDP in Poland')

# Có thể logarit hoá các cột
plot(lifePL$Year, log(lifePL$GDP), type='b',
     main='GDP in Poland' ,sub="GDP values are log-transformed")

# Hoặc log kiểu khác
plot(lifePL$Year, lifePL$GDP, type='b',
     log="y",
     main='GDP in Poland' ,sub="GDP values are log-transformed",
     xlab="Year", ylab="GDP")

      ### Density Plot 
density(lifePL$Life.expectancy)
plot(density(lifePL$Life.expectancy))

      ### Bar Plot
barplot(lifePL$Life.expectancy, ylim=c(0,80))
barplot(lifePL$Life.expectancy, ylim=c(0,80),
        col="aquamarine")

      ### Histogram
?hist
hist(lifePL$Life.expectancy, col="lightgray",
     main="Histogram of")
hist(lifePL$Life.expectancy,breaks = c(60, 65, 70, 75, 80),
     col="lightgray",
     main="Histogram of")
hist(lifePL$Life.expectancy,breaks = seq(70, 80, 2),
     col="lightgray",
     main="Histogram of")

# Func lines allows to add new lines to 
# Func points is for adding points

hist(lifePL$Life.expectancy, freq = TRUE)
lines(density(lifePL$Life.expectancy))

hist(lifePL$Life.expectancy,breaks = seq(72,79,1),
     col="lightblue",
     main="Histogram of")
lines(density(lifePL$Life.expectancy), col='red', lw=2)

?points

      ### Box Plot
summary(lifePL$Life.expectancy)
boxplot(lifePL$Life.expectancy)
boxplot(lifePLDE$Life.expectancy ~ lifePLDE$Country, names=c("DE", "PL"),
        xlab="Country", ylab="Expectancy", 
        main="Comparison Of Life Expectancy", sub="Values for 2000-2015",
        col = "purple")

      ### Violin Plot
# Install and load ggplot2
library(ggplot2)

# Create sample data
set.seed(123)
data <- data.frame(
  Category = factor(rep(c("A", "B", "C"), each = 100)),
  Value = c(rnorm(100, mean = 0), rnorm(100, mean = 2), rnorm(100, mean = 1))
)

# Create violin plot
ggplot(data, aes(x = Category, y = Value, fill = Category)) +
  geom_violin(trim = FALSE) +  # Violin plot
  geom_boxplot(width = 0.1, fill = "white") +  # Add box plot inside
  theme_minimal() +
  labs(title = "Violin Plot with ggplot2",
       x = "Category",
       y = "Value")


      ### DOT Chart - Identification of the outliners
dotchart(lifePL$Life.expectancy)
dotchart(lifePLDE$BMI, groups = factor(lifePLDE$Country))


      ### Investigating the relations between variables
plot(lifePL)
pairs(lifePL[ ,c(4, 17:18, 22)], panel = panel.smooth)

      ### Correlation Plot
# Có rất nhiều thư viện hay, thầy sẽ giới thiệu thư viện này, các trường đh lớn trên thế giới
# thích dùng
#install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(lifePL[ ,c(4, 17:18, 22)], histogram = TRUE, pch=19)

install.packages("corrplot")
library(corrplot)

cor(lifePL[ ,c(4,17:18,22)])
corrplot(cor(lifePL[ ,c(4,17:18,22)]))
corrplot(cor(lifePL[ ,c(4,17:18, 22)]), type="lower", order="hclust",
         method="number", add=TRUE)
corrplot.mixed(cor(lifePL[, c(4,17:18, 22)]), upper = "number", 
               lower = "circle", order = "alphabet")

### Additional resources 
# https://rstudio-pubs-static.s3.amazonaws.com/84527_6b8334fd3d9348579681b24d156e7e9d.html

# https://ramnathv.github.io/pycon2014-r/visualize/base_graphics.html

# https://statsandr.com/blog/descriptive-statistics-in-r/#mosaic-plot
         