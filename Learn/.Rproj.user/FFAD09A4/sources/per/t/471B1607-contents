vector1 <- c(1,2,3)
vector2 <- c(1:10)
help(c)

#class(): check data type

#is.numeric(): check numeric True/False
#is.integer() / is.logical() : check cac loai
#is.character() : check xem du lieu co phai la character hay khong (co the la ky tu don hoac chuoi)

#Chuyen doi kieu
#as.numeric() / as.integer() / as.logical() / as.character() / as.Date()

a <- 1.5
is.numeric(a)
is.integer(a)

a<- as.integer(a)
class(a)
a

b <- 6.9
class(b)
b <- as.integer(b)
class(b)
b


### LOGICAL ###

# TRUE/FALSE
# T / F
# 1 / 0

# Logical operatiors in R: &, |, ! (and, or, not)

a <- 5; b<- 3; c<- 1
a + b + c

z = a < b
z
class(z)


## CHARACTER

# Du lieu van ban / ky tu
# Su dung 'quotation'

a<- "z"
b<- "Phat"
class(a)

d <- "9.66"
d
d <- as.numeric("9. sau sau")
d
d<- "9.66"



## DATE ##
# Trong R co nhieu cach de xy ly du lieu ngay thang.
# Cách tiêu chuẩn từ R là sử dụng as.Date()
# Ngày tháng được lưu trữ dưới dạng số ngày tính từ 1970-nay. Với gtri âm cho ~ ngày trước đó
# Định dạng này chỉ ưu trữ thông tin ngày. Ko gồm giờ,phút,giây

datel <- "2025-01-11"
class(datel)
as.numeric(datel)
date2 <- as.Date(datel)
class(date2)
as.numeric(date2)

date3 <- as.Date("2004-01-11")
as.numeric(date3)


# 01/02/2025
# 01-03-2028

# as.Date() formatting
# %d: day(0->31) (1-31)
# %a / %A : ten cua ngay trong tuan: Sun/Sunday
# %n : month (00-12)
# %b / %B : ten cua thang: Jan / January
# %y / %Y : year : 25 / 2025

dates <- c("11/20/80", "11/30/1993", "10/10/93")
dates.D <- as.Date(dates)

dates.D <- as.Date(dates, format = "%m/%d/%y")
dates.D


# Xử lý ngày tháng NÂNG CAO
# Để xử lý, bạn có thể sử dụng các lớp POSIX cho phép xldl ngày-giờ
# Với điều chỉnh múi giờ và thường được dùng cho phân tích chuỗi thời gian của dữ liệu chứng khoán
# CÁCH SỬ DỤNG
# usage:



time1 <- as.POSIXct("2025-02-16 10:15:00")
time1

time2 <- as.POSIXct("2025-02-16 14:30:00", tz="Asia/HO_CHI_MINH")
time2

time3 <- as.POSIXct("16/02/2024 14:30:00", 
                    format="%d/%m/%Y %H:%M:%S")
time3

today <- Sys.Date()
today

todayFomartted <- format(today, format = "%A %d %B %Y")
todayFomartted
