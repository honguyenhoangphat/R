# VECTOR
# MATRIX
# LIST
# DATA FRAME

# VECTOR
# Là một dãy dữ liệu cùng kiểu (cùng class)
# # là cấu trúc dữ liệu cơ bản trong R
# mỗi biến đơn lẻ trong R thực chất chính là một vecto 
# 
# 
# vecto 
# Matrix
# List
# Data frame
# 
# 
# Phương thức tạo vecto
# lệnh cơ bản để tạo vecto là c() ( combine - kết hợp    nhiều riêng rẻ thành vecto)
# ngoài ra có các hàm hữ ích khác như:
#   
#   rep() (replicate - sao chép)
#   seq() ( requence - tạo dãy số)
# 
#   kiểu dữ liệu của vecto chính là kiểu dữ liệu của các phần tử trong nó
#
# rep() (replicate - sao chép)
# seq() (sequence - tạo dãy số)


# sử dụng c()
v1 <- c(1,2,3,4,5)
v2 <- c("A", "B", "C", "D", "E" )
class(v2)  
vmix <- c(1, "A", 2, "B", 3, "C")
class(vmix)


# # lưu ý:
# vecto luôn chứa các phần tử cừng kiểu
# nếu trộn các kiểu R sẽ chuyển đổi tất cả về cùng
# thường là chuyển về kiểu dữ liệu "mạnh" nhất:
#   logical < integer < numeric < character 


# sử dụng : để tự động tạp 
v3 <- c(1:10)
v3
class(v3)

v4 <- c(1.5:3.5)
v4

v5 <- c(1.5:3.5)

v6 <- c(TRUE, FALSE, T, F)
v6

# Sử dụng rep
v7 <- rep(1, times = 10)
v7

v8 <- rep(c(1,2), times = 3)
v8

v9 <- rep(c(1,2), each=3)
v9

v10 <- rep(c(1,2), times=3, each=3)
v10


# Tạo dãy số seq() - SEQUENCE
s1 <- seq(1,5)
s1

s2 <- seq(from=10, to=20)
s2

s3 <- seq(1,10, by = 2)
s3

s4 <- seq(5, 1, by=-1)
s4

today <- Sys.Date()
today
today <- as.Date(Sys.Date())
today
dates <- seq(today, as.Date("2030-12-30"), by="day")
dates

x <- c(1,4)
y <- seq(2,8, by=2)

x + y
x - y
x/y
x^2

#INDEX TRONG VECTOR
# INDEX TRONG R BAT DAU TU 1!

x <- seq(1,20)
x

y <- seq(0,10)
y
y[3]
y[8]
y[-1]
y[-2]

index <- c(3,5,7)
y[index]

index2 <- c(3,5)
y[index2]

c(c(2:5), c(3:7), seq(0:10))
y
y[7:8]

vectorNaqmed <- c("Hoang", "Phat", "21 years old")
names(vectorNaqmed) <- c("name", "surname", "age")
vectorNaqmed["age"]
vectorNaqmed['surname']

vectorNaqmed[c("surname", "age")]
