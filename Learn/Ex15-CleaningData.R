### Các bài tập ######################################################################
# 1. Đọc mô tả dữ liệu phân tích tính cách khách hàng và tải 
# vào R (file clients.csv) với tên biến là "clients".

getwd()
wd <- "D:/R-intro/data"
setwd(wd)
clients <- read.csv("clients.csv")
head(clients)


# 2. Xem qua cấu trúc dữ liệu và kiểm tra các lớp (classes) đã được gán
# cho các biến trong bộ dữ liệu.
str(clients)
summary(clients)


# 3. Kiểm tra xem có giá trị nào bị thiếu trong bộ dữ liệu không.
# a) Những biến nào có chứa giá trị bị thiếu?
missing_counts <- sapply(clients, function(x) sum(is.na(x)))
print(missing_counts)
clients[!complete.cases(clients),]

# b) Điền các giá trị bị thiếu bằng giá trị trung bình hoặc trung vị của biến đó.
#1.Điền trung bình cột Year_Birth
clients[is.na(clients$Year_Birth), ] <- round(mean(clients$Year_Birth, na.rm = TRUE))
#2.Điền dữ liệu cột MntWines
clients[is.na(clients$MntWines), ] <- mean(clients$MntWines, na.rm = TRUE)
is.na(clients$MntWines)
#3.Điền dữ liệu cột Response bằng trung vị
clients[is.na(clients$Response), ] <- median(clients$Response, na.rm = TRUE)
clients[!complete.cases(clients),]
#Tất cả missing value đã được điền bằng các loại khác nhau

# Trước khi điền, hãy xem xét bản chất của biến. Nếu là số nguyên (ví dụ: năm sinh),
# thì hãy điền giá trị phù hợp với bản chất của biến (chúng ta không muốn năm sinh là 1995.832, phải không? ;)).
# c) Bạn sử dụng đoạn mã nào để điền các giá trị bị thiếu của Year_Birth (nếu có)?
clients[is.na(clients$Year_Birth), ] <- round(mean(clients$Year_Birth, na.rm = TRUE))
#Phân tích: Khi ta dùng (mean(clients$Year_Birth, na.rm = TRUE), kết quả sẽ trả về 1949,016
#Vì vậy tôi đã thêm hàm round ở trước để làm tròn, nếu có thắc mắc, hãy dùng ?round
?round


# 4. a) Kiểm tra xem tất cả các giá trị bị thiếu đã được điền đầy đủ chưa. Nếu chưa, lặp lại bước 3.
# b) Bạn sẽ dùng đoạn mã nào để hiển thị tất cả các dòng vẫn còn chứa dữ liệu bị thiếu?
#Tôi sử dụng clients[!complete.cases(clients),], kết quả trả về là 0 rows bị thiếu
clients[!complete.cases(clients),]


# 5. a) Xem xét những biến nào nên chuyển đổi thành kiểu "factor"?
# Gợi ý: Đây thường là các biến văn bản có một số giá trị cụ thể và lặp lại.
# Chúng cũng có thể là các biến được biểu diễn bằng số nhưng không mang "ý nghĩa số học"
# - ví dụ: biến "education" với các giá trị 2, 3, 4 thực chất đại diện cho các cấp độ
# giáo dục liên tiếp (ý nghĩa logic) thay vì số năm học tập chính xác (ý nghĩa số học).

str(clients)
unique(clients$Education)
#Xử lý cột EDUCATION, có các giá trị không hợp lệ như 0, 1969, 291,604
#Gán NA cho các giá trị trên, sau đó điền giá trị trung vị vào các vị trí đó
col_edu <- c("Basic", "2n", "Graduation", "PhD", "Master")
#Dùng hàm ifelse() để thay thế các giá trị không nằm trong tập hợp hợp lệ
clients$Education <- ifelse(clients$Education %in% col_edu, clients$Education, NA)
clients$Education <- factor(clients$Education, levels = col_edu, ordered = TRUE)

# Chuyển Education thành số theo thứ tự của levels
edu_numeric <- as.numeric(clients$Education)
# Tính median của các giá trị số
median_val <- median(edu_numeric, na.rm = TRUE)
# Lấy lại level tương ứng với median
median_level <- col_edu[median_val]

# Thay thế các giá trị NA bằng giá trị trung vị
clients$Education[is.na(clients$Education)] <- median_level

unique(clients$Education)

#XỬ LÝ CỘT MARITAL_STATUS
unique(clients$Marital_Status)
col_marital <- c("Single", "Married", "Together", "Divorced", "Widow")
#Dùng hàm ifelse() để thay thế các giá trị không nằm trong tập hợp hợp lệ
clients$Marital_Status <- ifelse(clients$Marital_Status %in% col_marital, clients$Marital_Status, NA)
clients$Marital_Status <- factor(clients$Marital_Status, levels = col_marital, ordered = TRUE)

# Chuyển thành số theo thứ tự của levels
edu_numeric <- as.numeric(clients$Marital_Status)
# Tính median của các giá trị số
median_val <- median(edu_numeric, na.rm = TRUE)
# Lấy lại level tương ứng với median
median_level <- col_marital[median_val]

# Thay thế các giá trị NA bằng giá trị trung vị
clients$Marital_Status[is.na(clients$Marital_Status)] <- median_level
unique(clients$Marital_Status)


#THAY THẾ CỘT TEENHOME
unique(clients$Teenhome)
col_teen <- c("0", "1", "2")
clients$Teenhome <- ifelse(clients$Teenhome %in% col_teen, clients$Teenhome, NA)
clients$Teenhome <- factor(clients$Teenhome, levels = col_teen, ordered = TRUE)
edu_numeric <- as.numeric(clients$Teenhome)
median_val <- median(edu_numeric, na.rm = TRUE)
median_level <- col_teen[median_val]
clients$Teenhome[is.na(clients$Teenhome)] <- median_level
unique(clients$Teenhome)
# b) Bạn sẽ dùng đoạn mã ngắn nhất nào để chuyển đổi biến Marital_Status?
clients$Marital_Status <- factor(clients$Marital_Status, levels = col_marital, ordered = TRUE)


# Quá trình xử lý khá phức tạp, tôi sẽ nêu rõ từng bước để có thể dễ hình dung.
#B1: Tạo một danh sách các biến được cho là hợp lệ của cột
#B2: Đưa các giá trị không hợp lệ thành NA bằng hàm ifelse
#B3: Đưa về dạng factor cho các biến hợp lệ
#B4: Đưa về dạng số, mới tính median được, sau đó đưa các giá trị NA thành giá trị level tương ứng



# 6. a) Xem xét biến nào trong số các biến đã xác định ở trên nên được
# chuyển đổi thành kiểu 'ordered factor' (biến phân loại có thứ tự).
# Gợi ý: Biến kiểu 'ordered factor' nên chứa các mức có thứ tự logic
# - ví dụ: biến 'education' với các giá trị 'primary', 'secondary'
# và 'tertiary'. Trong trường hợp này, việc giữ thứ tự các mức là quan trọng.
# Một ví dụ điển hình khác của biến ordered factor là các câu trả lời
# khảo sát sử dụng thang đo Likert (https://en.wikipedia.org/wiki/Likert_scale).
# b) Bạn sẽ dùng đoạn mã nào để chuyển đổi biến Education? Giả sử rằng
# 2n nghĩa là giáo dục trung học và graduation tương đương với bảo vệ bằng cử nhân.

#Tôi đã gộp câu 5 và câu 6 lại làm một


# 7. Chuyển đổi các biến đã xác định trong bước 5 và 6 thành các lớp thích hợp.

# Câu 7 cũng đã được làm ở câu 5

# 8. Lưu kết quả để tham khảo sau này! Sử dụng file RData với tên "clientsInR".

save(clients, file = "clientsInR.RData")




















