# DATAFRAME TRONG R
# DATAFRAME là một cấu trúc dữ liệu dùng để lưu trữ dữ liệu
# dạng bảng trong R (phổ biến trong phân tích thống kê và machine learning)
# Dataframe có thể được xem là một danh sách các vector có cùng độ dài và
# thường có tên duy nhất.

#Tạo DATAFRAME -> được tạo bỏi các vector cùng độ dài

column1 <- c(1:3)
column2 <- c("Nguyen", "Hoang", "Phat")
column3 <- c(T,T,F)

dataset1 <- data.frame(column1, column2, column3)
dataset1

# Tên của các cột
colnames(dataset1)

# Đổi tên cột số 2
colnames(dataset1)[2] <- "name"
dataset1

# Đổi tên nhiều cột
colnames(dataset1) <- c("#", "name", "checkTF")
dataset1


# 2. Thêm một dòng mới
newRow <- c(4, "Cong Tu P", T)
dataset2 <- rbind(dataset1, newRow)
dataset2
# Cach 2
newRowDF <- data.frame(5, "Lisa", F)
names(newRowDF) <- c("#", "name", "checkTF")
dataset3 <- rbind(dataset2, newRowDF)
dataset3
# -> Thay vì tạo một dòng mới r thêm vào, ta có thể tạo một dataset mới, 
# rồi nối hai dataset lại với nhau


# 3. Thêm một cột mới
newColumn <- c("a", "b", "c", "d", "e")
dataset4 <- cbind(dataset3, newColumn)
dataset4

# Cách 2, trực tiếp gán $ vào cột mới
dataset4$newColumn2 <- c(5,4,3,2,1)
dataset4
#Bắt buộc phải có cùng độ dài

# 4.Truy Xuất Dữ Liệu

# C1.  Bằng chi số
dataset4[3,2] # dong 2, cot 3

# C2.  Truy xuat bằng chỉ số và tên
dataset4[5, "checkTF"]

# C3. Truy xuất bằng tên cột
dataset4["name"]
dataset4[, "name"]
dataset4$name #-> Truy xuat truc tiep


# 5. MỘT SỐ HÀM CẦN NHỚ 
# head(): hien thi vai dong dau
# tail(): hien thi vai dong cuoi
# str(): hien thi cau truc du lieu
# summary(): tom tat thong ke
head(dataset4)
tail(dataset4)
str(dataset4)
summary(dataset4)


# 6. THAY ĐỔI KIỂU DỮ LIỆU - DATATYPE
class(dataset4$checkTF)
dataset4$checkTF <- as.integer(dataset4$checkTF)
dataset4


# 7. BUILD-IN DATA FRAMES
# LẤY RA TOÀN BỘ DATASET CÓ SẴN
data()
iris
View(iris)

CO2
head(CO2)
summary(CO2)













