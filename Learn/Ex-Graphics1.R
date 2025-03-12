# ===============================================================================
# Bài tập phân tích dữ liệu với R
# ===============================================================================

# ===============================================================================
# Bài 1: Vẽ biểu đồ phân phối với dữ liệu USArrests
# ===============================================================================

# 1a) Sử dụng tập dữ liệu USArrests (tập dữ liệu có sẵn) để vẽ biểu đồ histogram 
# thể hiện phân phối của biến Assault.

USArrests
hist(USArrests$Assault, main="Phan Phoi", col="blue")

# 1b) Thêm nhãn giá trị phía trên các cột (xem tài liệu hướng dẫn)
hist(USArrests$Assault,col='purple', labels =TRUE)
# 1c) Thêm tiêu đề "Phân phối số vụ tấn công ở Hoa Kỳ" cho biểu đồ đã tạo ở mục 1a).
hist(USArrests$Assault, main="Phan Phoi so vu tan cong o Hoa Ky", col="blue")

# ===============================================================================
# Bài 2: Xử lý dữ liệu insurance
# ===============================================================================

# 2a) Tải tập dữ liệu insurance.csv vào R (từ thư mục medical cost) và đặt tên là 
# insurance. Kiểm tra xem dữ liệu đã được tải đúng cách và các loại biến đã chính xác chưa.
insurance <- read.csv("D:/R-intro/data/graphics - medical cost personal dataset/insurance.csv")
head(insurance)
# 2b) Chuyển đổi biến sex thành kiểu factor.
str(insurance)
insurance$sex <- as.factor(insurance$sex)
# 2c) Làm tương tự với các biến smoker và region.
insurance$smoker <- as.factor(insurance$smoker)
insurance$region <- as.factor(insurance$region)

str(insurance)
# ===============================================================================
# Bài 3: Phân tích tương quan và vẽ biểu đồ
# ===============================================================================

# 3a) Sử dụng tập dữ liệu insurance để tạo biểu đồ tương quan giữa age (tuổi), 
# bmi (chỉ số khối cơ thể) và charges (chi phí y tế). Khi gọi các cột, hãy sử dụng 
# chỉ mục theo tên cột. Đảm bảo biểu đồ của bạn được tạo chỉ bằng một dòng mã. 
# Sử dụng các tham số mặc định của hàm corrplot (chưa thay đổi gì).
# Gợi ý: Sử dụng hàm corrplot() từ gói corrplot. Bạn có thể giả định rằng gói 
# corrplot đã được tải trong R.
# Gợi ý 2: Nhớ vẽ biểu đồ từ bảng tương quan được tạo bằng hàm cor().

library(PerformanceAnalytics)

chart.Correlation(insurance[ ,c("age","bmi","charges")], histogram = TRUE, col="pink")

library(corrplot)

cor(insurance[ ,c("age","bmi","charges")])
corrplot(cor(insurance[ ,c("age","bmi","charges")]))


# 3b) Sắp xếp các biến trên biểu đồ sử dụng thứ tự được cung cấp bởi thuật toán 
# phân cụm phân cấp (hclust).
corrplot(cor(insurance[ ,c("age","bmi","charges")]), type="lower", order="hclust",
         method="number", add=TRUE)
# 3c) Sửa đổi biểu đồ đã tạo ở mục trước. Thay đổi khu vực của biểu đồ sao cho 
# tam giác dưới hiển thị các giá trị số và tam giác trên hiển thị biểu diễn bằng các hình tròn.
# Gợi ý: Xem xét hàm corrplot.mixed().
corrplot.mixed(cor(insurance[ ,c("age","bmi","charges")]), lower = "number", 
               upper = "circle", order = "alphabet")
# 3d) Tạo biểu đồ boxplot cho biến charges (chi phí y tế) theo region (khu vực). 
# Thay đổi tiêu đề trục thành "Chi phí y tế" và "Khu vực".
boxplot(insurance$charges ~ insurance$region,
        ylab="Chi phi y te", xlab="Khu vuc")
# 3e) Điều chỉnh boxplot và thêm nhiều kiểu dáng hơn. Đặt tên cho các trục, 
# thay đổi màu sắc của các phần tử, v.v. Hãy thử nghiệm với các đối số của hàm plot.
boxplot(insurance$charges ~ insurance$region, 
        main = "Chi phi Y te theo Khu Vuc",
        ylab="Chi phi y te", xlab="Khu vuc", col=c("bisque", "pink", "lightblue", "yellow"), 
        border="darkblue", #mau vien cac hop
        names=c("Dong Bac", "Tay Bac", "Dong Nam", "Tay Nam"),
        log = "y",
        notch=TRUE, # Thêm khuyết vào hộp để so sánh trực quan
        las = 1)
