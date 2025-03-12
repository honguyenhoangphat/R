
#LIST trong R là một cấu trúc dữ liệu linh hoạt có thể cho nhiều 
# kiểu dữ liệu khác nhau
# Các đối tượng có độ dài khác nhau
# Các ctdl phức tạp (vector, matrix, dataframe)

#Tạo một LIST đơn giản

student <- list(
    name = "Phat",
    age = 18,
    grades = c(8.5, 9.0, 7),
    passed = TRUE
)

#CÁCH 1: Dùng [ ] -> trả về list

student[1]
class(student[1])

#CÁCH 2: DÙNG [[ ]] -> trả về nội dung

student[[1]]
class(student[[1]])

#CÁCH 3: DÙNG $ -> truy cập theo tên
student$grades

student$ID <- '012345678'
student

student$grades <- c(10,10,10)
student
