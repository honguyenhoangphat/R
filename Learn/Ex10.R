# Nhiệm vụ
# 1. Tạo và thêm tên duy nhất vào năm vector có độ dài 8. 
#Làm cho các kiểu dữ liệu của chúng đa dạng. 
#Tạo một dataframe có tên "mySet1" từ các vector đã tạo.
# a) Hiển thị dòng thứ 5 của dataframe đã tạo.


column1 <- c(1:8)
column2 <- c("Nguyen", "Hoang", "Phat", "Cong", "Tu", "Negative", "Per", "GAS")
column3 <- c(T,T,F,T,T,F,F,F)
column4 <- c(8,7,6,5,4,2,1,0)
mySet1 <- data.frame(column1, column2, column3, column4)
mySet1


"""
vector1 <- 1:8 # so nguyen
vector2 <- seq(0,1, length.out(8)) #so thuc
vector3 <- c(T,T,F,T,T,F,F,F)
vector4 <- c("Nguyen", "Hoang", "Phat", "Cong", "Tu", "Negative", "Per", "GAS")
"""
# b) Thay đổi tên của cột thứ hai của dataframe mySet1 thành "column02"
colnames(mySet1)[2] <- "column02"
colnames(mySet1)

# c) Hiển thị 7 dòng đầu tiên của dataframe mySet1. 
#Sử dụng hai phương pháp khác nhau - với chỉ số và với một hàm.
head(mySet1, n = 7)
help(head)

# 2. Sử dụng bộ dữ liệu iris. Sử dụng chỉ số để hiển thị giá trị của 
#mỗi dòng thứ 3 giữa quan sát thứ 40 và 120. Cố gắng sử dụng một dòng lệnh duy nhất 
#(rút gọn mã để nó vừa trong một dòng duy nhất, không có bất kỳ bước trung gian nào).

View(iris)
iris[seq(40, 120, 3), ]

# 3. Sử dụng bộ dữ liệu có sẵn "women".
# a) Thay đổi kiểu của cột đầu tiên thành kiểu ký tự.
View(women)
head(women)
class(women$height)
women$height <- as.character(women$height)
class(women$height)
# b) Thêm hai dòng mới vào bộ dữ liệu với các số tự tạo. 
#Đảm bảo rằng bạn không làm mất các kiểu của biến trong dataframe chính trong 
#quá trình này.
new_rows <- data.frame(
  height = as.character(c(165, 170)),
  weight = c(60, 65)
)
new_rows
women
women <- rbind(women, new_rows)


# c) Thêm biến mới vào bộ dữ liệu và đặt tên là "shoe_size". 
#Sử dụng hàm runif để tạo các giá trị cho biến này. 
#Kích thước giày phải là số nguyên giữa 35 và 42.
women$shoe_size <- floor(runif(nrow(women), min = 35, max = 42))














