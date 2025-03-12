# data
#number
# string
#.......

#Dữ liệu số thực: tuổi, điểm số,vv
#Dữ liệu văn bản tự do: tên,vvv
#Dữ liệu số nguyên: ID, MSSV,vv

#Dữ liệu thể loại (categorical data):
# color: red, blue
# value: low, medium, high
# education: highschool, bachelor, master, PhD
# grades: A, A+, B, B+
#       => FACTOR: Là kiểu dữ liệu phân loại với các mức độ (levels) xác định


# UNORDERED FACTOR: Factor không có thứ tự
colors <- factor(c("blue", "red", "yellow"))

#ORDERED FACTOR: FACTOR CÓ thứ tự
ratings <- factor(c("low", "medium", "high"),
                  levels = c("low", "medium", "high"),
                  ordered = TRUE
                  )

# VÍ DỤ
# Dữ liệu giáo dục
education <- factor( c("High School", "Bachelor", "Master", "PhD"),
                     levels = c("High School", "Bachelor", "Master", "PhD"),
                     ordered = TRUE)

str(education)
levels(education)


# Tạo dữ liệu điểm số của học sinh
grades <- factor(
  c("Giỏi", "Khá", "Trung bình", "Giỏi", "Khá", "Yếu"),
  levels = c("Yếu", "Trung bình", "Khá", "Giỏi"),
  ordered = TRUE  # Có thứ tự từ yếu đến giỏi
)

table(grades)
levels(grades)

# Khảo sát khách hàng
satisfaction <- factor(
  c("Rất thích", "Thích", "Bình thường", "Không thích", 
    "Thích", "Rất thích", "Bình thường"),
  levels = c("Không thích", "Bình thường", "Thích", "Rất thích"),
  ordered = TRUE
)

table(satisfaction)
# Vẽ biểu đồ
barplot(table(satisfaction))

# Kích cỡ áo
sizes <- factor(
  c("M", "L", "S", "XL", "M", "S", "M", "L", "XL", "M"),
  levels = c("S", "M", "L", "XL"),
  ordered = TRUE
)
table(sizes)
# Thống kê số lượng mỗi size
summary(sizes)
barplot(table(sizes))
