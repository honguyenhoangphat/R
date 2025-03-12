# Thống kê và mô hình trong R

# Thiết lập môi trường
Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANGUAGE = "en")

# 3 Thống kê cơ bản
# 3.1 Các hàm thống kê trong R

# Sử dụng dữ liệu airquality có sẵn trong R
data("airquality")
head(airquality)

# Xem cấu trúc dữ liệu
str(airquality)

# Xem thông tin tổng quát
summary(airquality)

# 3.3 Tính min và max
min_ozone <- min(airquality$Ozone, na.rm = TRUE)
max_ozone <- max(airquality$Ozone, na.rm = TRUE)

# Hiển thị đồng thời GTLN và GTNN
range(airquality$Ozone, na.rm=TRUE)

# 3.4 Tính trung bình, trung vị
mean_ozone <- mean(airquality$Ozone, na.rm=TRUE)
median_ozone <- median(airquality$Ozone, na.rm=TRUE)
mean_ozone

# 3.5 Tính phân vị và Khoảng tứ phân vị

# Phân vị 25%
Q1 <- quantile(airquality$Ozone, 0.25, na.rm=TRUE)
Q2 <- quantile(airquality$Ozone, 0.5, na.rm=TRUE)
Q3 <- quantile(airquality$Ozone, 0.75, na.rm=TRUE)

# Tính tất cả tứ phân vị cùng lúc
quantile(airquality$Ozone, probs = c(0, 0.25, 0.5, 0.75), na.rm=TRUE)

#IQR Khoảng tứ phân vị
Q3-Q1
IQR_ozone <- IQR(airquality$Ozone, na.rm=TRUE)
IQR_ozone

# 3.6 Độ lệch chuẩn
sd <- sd(airquality$Ozone, na.rm=TRUE)

# 3.7 Phương sai
var_ozone <- var(airquality$Ozone, na.rm=TRUE)
var_ozone
# hoặc ph sai là bình phương độ lệch chuẩn
var <- sd^2
var

# Tính toán tự động cho nhiều biến
lapply(airquality[, 1:4], mean, na.rm=TRUE)

lapply(airquality[, 1:4], sd, na.rm=TRUE)

# 3.8 Sử dụng Package
# Cài đặt: install.packages("package_name")
# Sử dụng: library("package_name")
install.packages("pastecs")
library(pastecs)
# Tổng hợp thống kê cho 3 cột đầu tiên
stat.desc(airquality[, 1:3])

# Làm tròn kết quả cho dễ đọc
round(stat.desc(airquality[, 1:3]), 2)
