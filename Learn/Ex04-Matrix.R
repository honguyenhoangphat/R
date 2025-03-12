#MATRIX
# Matrix là cấu trúc dữ liệu 2 chiều trong R
# chứa các phần tử cùng kiểu dữ iệu (numeric, chẩcter,)
# được sắp xếp thành hàng (rows) và cột (columns)

# TẠO MATRIX TỪ VECTOR
# CÁCH 1: CHỈ ĐỊNH SỐ HÀNG, SỐ CỘT

mat1 <- matrix(1:6, nrow = 2, ncol = 3)
mat1

#CÁCH 2: CHỈ ĐỊNH CÁCH ĐIỆN (byrow)

mat2 <- matrix(1:6, ncol=3, byrow = TRUE)
mat2

#TẠO MATRIX RỖNG

empty.mat <- matrix(NA, nrow=3, ncol=2)
empty.mat

#TẠO MATRIX 0

zero.mat <- matrix(0,nrow=2,ncol=2)
zero.mat

# VÍ DỤ:

grades <- matrix(
        c(
          8.5, 9, 7.5, 8.8,
          8.2, 9.5, 7, 8.0,
          7, 4.5, 7, 10
        ),
        nrow = 3, ncol=4, byrow=TRUE
)
grades
rownames(grades) <- c('Nguyen Van A', 'Le Van C', 'Tran Thi X')
colnames(grades) <- c('Toán', 'Văn', 'Lý', 'Hoá')
grades


# DỮ LIỆU BÁN HÀNG THEO "THÁNG"
sales <- matrix(
    c(150, 200, 180,
      120, 160, 140,
      180, 220, 200),
    nrow = 3,
    ncol = 3,
    byrow = TRUE,
    dimnames = list(
      c("SP1", "SP2", "SP3"),
      c("T1", "T2", "T3")
    )
  )
sales  

sales[1:2]
sales[1,]
sales[,1]
sales[1:2,]
sales[,2:3]


# Dựa vào tên của cột, hàng


sales[, "T1"]
sales["SP2",]

# TÍNH TOÁN

rowSums(sales)
colSums(sales)
rowMeans(sales)
barplot(sales)
