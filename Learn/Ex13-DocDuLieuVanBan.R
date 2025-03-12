# Thư mục làm việc
getwd() #wd: working directory
?getwd

wd <- "D:/R-intro/data"
setwd(wd)
tb1 <- read.table("D:/R-intro/data/graphics - water quality/water_potability.csv",
                  header = TRUE, sep = " ")
View(tb1)
summary(tb1$Price)

###
water <- read.csv("D:/R-intro/data/graphics - water quality/water_potability.csv")
head(water)


install.packages("readxl")
library(readxl)
?read_excel

loan_prediction_excel <- read_excel("D:/R-intro/data/dataset - loan prediction/loan_prediction_excel.xlsx",
                                    )
View(loan_prediction_excel)

loanExcel2 <-read_excel("D:/R-intro/data/dataset - loan prediction/loan_prediction_excel.xlsx",
                        sheet=2)
loanEXCEL1 <- as.data.frame(loan_prediction_excel)

#Clean the environment from unnecessary files
remove(loanExcel2)
#Xoa de bot ngon RAM


ls() #Xem tất cả đối tượng có trong file

#Lưu trữ xuống file
#save(list = ls(all.names = TRUE), file="data/all.rda")
# Lưu trữ xuống file
save(list = ls(all.names=TRUE), file="data/all.rda")

rm(list = ls(all.names = TRUE)) # cleaning the while memory

# Load data
load("data/all.rda")

# lưu trữ 1 đối tượng
save(loanEXCEL1, file="data/loanEXCEL1_inR.rda")


rm(loanEXCEL1)
loanEXCEL1

load("data/loanEXCEL1_inR.rda")
head(loanEXCEL1)

# lưu trữ 1 đối tượng
save(loanEXCEL1, loanEXCEL2, file="data/loanEXCEL12_inR.rda")


rm(loanEXCEL1)
loanEXCEL1
