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

#Tao du lieu gia dinh ve tuoi tho o Poland va Germany
set.seed(123)
years <- 2000:2015
lifePL <- data.frame(
  Country = rep("Poland", 16),
  Year = years,
  Life.expectancy = 73 + (years-2000) *0.2 + rnorm(16,0,0.3)
)
lifePL
lifeDE <- data.frame(
  Country = rep("Germany", 16),
  Year = years,
  Life.expectancy = 75 + (years-2000) *0.2 + rnorm(16,0,0.3)
)
lifeDE
# Ket hop du lieu 2 quoc gia
lifePLDE <- rbind(lifePL, lifeDE)
lifePLDE
# 2 PP tung buoc de chinh sua 
# 2.1 Bieu do co ban - Lop dau tien
# 2 Phương pháp từng bước để chỉnh sửa biểu đồ
# 2.1 Biểu đồ cơ bản - Lớp đầu tiên
plot(lifePLDE[lifePLDE$Country=="Poland", "Year"],
     lifePLDE[lifePLDE$Country=="Poland", "Life.expectancy"]
      )


# 2.2 Thêm lớp thứ hai
# Bây giờ, chúng ta thêm một đường cho tuổi thọ ở Đức:
plot(lifePLDE[lifePLDE$Country=="Poland", "Year"],
     lifePLDE[lifePLDE$Country=="Poland", "Life.expectancy"]
      )
lines(lifePLDE[lifePLDE$Country=="Germany", "Year"],
      lifePLDE[lifePLDE$Country=="Germany", "Life.expectancy"])  

# 2.3 Điều chỉnh phạm vi trục Y
# Chúng ta điều chỉnh phạm vi của trục Y để có thể thấy rõ cả hai đường:
