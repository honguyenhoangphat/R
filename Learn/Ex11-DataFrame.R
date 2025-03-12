




# TẠO dataframe
set1 <- data.frame(
  IDClient = c(1:6, 8 ), 
  Product = c(rep("Thit Kho",4), rep("Ca Kho", 3))
)
set2 <- data.frame(
  IDClient = c(1,2,5,9),
  Region = c(rep("TP.HCM",3), "Dong Nai")
)


# Gộp dữ liệu: JOIN

#Inner Join: 

set3 <- merge(set1, set2)
set3

#Outer Join: GOP TAT CA
set4 <- merge(x=set1, y=set2, by = "IDClient", all=TRUE)
set4

#Left Join: (Uu tien bang ben TRAI)
set5 <- merge(x=set1, y=set2, by= "IDClient", all.x = TRUE)
set5

#Right Join: UU TIEN BANG BEN PHAI
set6 <- merge(x=set1, y=set2, by= "IDClient", all.y = TRUE)
set6


#### CHUYỂN VỊ DỮ LIỆU: TRANSPOSING DATA
t(set1)

ten <- 1:10
t(ten)




#SẮP XẾP

#Theo chỉ số
set1[1:7, ]
set2[7:1,]

#Sắp xếp theo giá trị
sort(set1$IDClient) #Tăng
sort(set1$IDClient, decreasing = TRUE) #GIẢM

set1(order(set1$IDClient), )






#LỌC DỮ LIỆU - FILTER
set1[2, 0] # Trái dòng, phải cột

# Lọc theo điều kiện ()
set1[set1$Product == "Ca Kho", ]

# Thêm & (và) để lọc nhiều điều kiện
set1[set1$Product == "Ca Kho" & set1$IDClient > 6,]




# LẤY RA SET CON
setA <- set1[set1$Product=="Ca Kho",]
setA
setB <- subset(set1, Product=="Thit Kho", )
setB

#Làm việc với dữ liệu phân loại factor
set4$Product <- as.factor(set4$Product)
set4$Region <- as.factor(set4$Region)
summary(set4)
set4

#Xử lý dữ liệu thiếu
is.na(set4$Product)
set4[is.na(set4$Product),]
set4[is.na(set4$Region),]

# Điền giá trị thiếu
set4$Region <- as.character(set4$Region)
set4[is.na(set4$Region), "Region"] <- "Viet Nam"
set4

set4$Product <- as.character(set4$Product)
set4[is.na(set4$Product), "Product"] <- "Cha ca"
set4




# Sử dụng complete.cases
setMissing = data.frame(
  IdClient = c(1:10), 
  Region = c(rep("western", 2), rep(NA, 2), rep("eastern", 1), rep(NA, 5)),
  Wages = c(seq(2000, 3500, 500), NA, seq(4000, 5000, 500), rep(NA, 2))
)
setMissing

#Lấy các dòng đầy đủ (Không NA)
setMissing[complete.cases(setMissing),]
#Có ít nhất một cột thiếu
setMissing[!complete.cases(setMissing),]

# -- Nếu dùng is.na thì ta phải kiếm tra từng cột, giả sử có 20 cột thì phải is.na 20 lần,
#thay vào dó, ta có thể dùng complete.cases để kiểm tra một cách rút gọn hơn










