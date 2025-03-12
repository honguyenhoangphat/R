# ### BÀI TẬP ###
# 
# 1. Tạo một factor với các giá trị "a", "b", "c" có độ dài 7. 
# Thêm nhãn "Letter A", "Letter B", "Letter C". 
# Tóm tắt giá trị của factor.

fac1 <- factor(
  c("a", "b", "c", "a", "a", "b", "c")
)
levels(fac1) <- c("Letter A", "Letter B", "Letter C")
fac1
summary(fac1)


# 2. Tạo một vector số có giá trị từ 1-4 và độ dài 10. 
# Bạn có thể sử dụng bất kỳ hàm nào để tạo vector. 
# Giá trị có thể được sắp xếp ngẫu nhiên. 
# Tóm tắt biến và kiểm tra kiểu của nó. 
# Sau đó sử dụng vector này để tạo một factor có thứ tự. 
# Đặt các mức "low" "medium" "high" "very high". 
# Tóm tắt giá trị và so sánh với vector ban đầu.


vec1 = sample(1:4, 10, replace=TRUE)
vec1
class(vec1)
summary(vec1)
fac <- factor(vec1,
              levels =c(1,2,3,4),
              ordered = TRUE
              )
fac
levels(fac) <- c("low", "medium", "high", "very high") 
summary(fac)


# 3. Tạo một ma trận có 5 hàng và 2 cột, điền số 0. 
# Lưu vào biến "table".
# a) Điền cột 1 với giá trị 3
# b) Đặt phần tử thứ 3 của cột 2 thành 20
# c) In các giá trị của cột 2. Kiểm tra kiểu giá trị trong cột này
# d) Thay đổi phần tử thứ 4 của cột 2 thành "twelve". 
# In lại giá trị của cột 2. Kiểm tra kiểu của chúng. Có gì khác?
#   e) Kiểu giá trị của cột 1 là gì? Tại sao?
#   

table <- matrix(0,nrow=5, ncol=2)
table[,1] <- 3
table[3,2] <- 20
table[,2]
class(table[,2])
table[4,2] <- "twelve"
class(table[,2])


#   4. Tạo bốn biến với các kiểu khác nhau (vectors, matrices, 
#                                           single values).
# Tạo một list từ các đối tượng này đặt tên "myList".
# a) Lấy phần tử thứ hai của list và thêm một giá trị vào đó.
# Lưu thay đổi để nó hiển thị trong list.
# b) Thêm phần tử mới vào cuối list - tạo thành vector 6 phần tử 
# với bất kỳ kiểu nào.
# c) In phần tử thứ 4 của đối tượng cuối cùng trong list.
# d) Thay đổi giá trị của phần tử thứ 5 của đối tượng cuối cùng 
# thành NA.


vec4 <- c("a", "b", "c")
mat4 <- matrix(1:6, nrow=2)
single_val <- 100

myList <- list(vec4, mat4, single_val)
myList[[1]] <- c(myList[[1]], c("d"))
myList[[1]]
myList

#b
#LẤY ĐỘ DÀI CỦA LIST
length(myList)

myList[[length(myList) + 1]] <- c(7, 8, 9, 10, 20) #Thêm một phần tử vào cuối LIST
myList[[length(myList)]][4] #c
#length(myList) là lấy ra số lượng đồ dài, mà số lượng đồ dài = với đối tượng cuối cùng của LIST

#d
myList[[length(myList)]] [5] <- NA
myList[[length(myList)]]
