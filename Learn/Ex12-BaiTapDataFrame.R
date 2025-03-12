# Sử dụng bộ dữ liệu có sẵn CO2 cho các nhiệm vụ sau:
# 1. In giá trị CO2 uptake từ lớn nhất đến nhỏ nhất.

sort(CO2$uptake, decreasing = TRUE)

# 2. Hiển thị các dòng của bộ dữ liệu CO2, nơi Type được đặt thành Quebec và 
#Treatment thành chilled.

CO2[CO2$Type == "Quebec" & CO2$Treatment == "chilled",]

# 3. Hiển thị các dòng của bộ dữ liệu CO2, nơi uptake lớn hơn 40 và
# bộ dữ liệu được sắp xếp theo giá trị conc từ nhỏ nhất đến lớn nhất.
# Thử giải chỉ một dòng. Nếu bạn cần tạo
# một đối tượng trung gian - đặt tên là 'temp'.

big_co2 <- CO2[CO2$uptake > 40, ]
big_co2
big_co2 <- big_co2[order(big_co2$conc),]
big_co2

#1 dòng
CO2[order(CO2$conc), ][CO2[order(CO2$conc), ] $uptake>40,]
# 4. Làm thế nào để có được một sắp xếp ngẫu nhiên của bộ dữ liệu CO2? GỢI Ý: Bạn có thể muốn có một
# vector với các chỉ số ngẫu nhiên sẽ đến từ kết quả order(unif(...)).
# set.seed(123)
# missCO2 <- CO2
# missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
# missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
# missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")
set.seed(123)
missCO2 <- CO2
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")

# 5. Hiển thị các dòng của bộ dữ liệu missCO2 có ít nhất một giá trị bị thiếu.

missCO2[!complete.cases(missCO2),]

# 6. Điền các giá trị uptake bị thiếu với giá trị 20.

missCO2[is.na(missCO2$uptake), "uptake"] <- 20
missCO2

# 7. Điền các giá trị conc bị thiếu với giá trị trung bình của conc.
is.na(missCO2$conc)
help(mean)
mean_conc = mean(missCO2$conc, na.rm = TRUE) #tìm gtri trung bình
mean_conc
mean_conc <- missCO2$conc[is.na(missCO2$conc)] # điền gtri thiếu
missCO2

# 8. Trích xuất giá trị số từ biến weight và lưu chúng trong cột mới
# "weightNumber".
#C1
library(stringr)
missCO2$weightNumber <- str_extract(missCO2$weight, "\\d+")
missCO2
#C2 
missCO2$weightNumber2 <- as.numeric(sub("kg", "", missCO2$weight))
head(missCO2)
#C3
# Trích xuất giá trị số từ cột weight
missCO2$weightNumber3 <- as.numeric(substring(missCO2$weight, 1, nchar(missCO2$weight) - 2))
print(missCO2)
#nchar: vị trí kết thúc(bỏ qua 2 ký tự cuối, cụ thể ở đây là "kg")

#C4: Sử dụng strsplit
#Nếu không có định dạng cố định, thì sử dụng. Tách chuỗi và trích xuất phần số
missCO2$weightNumber4 <- sapply(strsplit(missCO2$weight, "[^0-9.]+"), function(x) as.numeric(x[1]))













# LƯU DATAFRAME VÀO TỆP CSV
write.csv(missCO2, "missCO2.csv", row.names = TRUE)
# Vao tep RDS (dinh dang R)
saveRDS(missCO2, "missCO2.rds")
# Luu nhieu doi tuong vao mot tep RData
save(iris, mtcars, file="multiple_datasets.Rdata")