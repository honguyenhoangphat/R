# Mô phỏng biến ngẫu nhiên trong R

# 2.2.1 Biến ngẫu nhiên rời rạc

#heads= mặt ngửa, tails= mặt sấp
set.seed(123)
coin_flips <- sample(c("heads", "tails"), size=10, replace = 10 )
print(coin_flips)

# 2.2.2 Biến ngẫu nhiên liên tục

# Tạo một mẫu ngẫu nhiên của chiều cao theo phân phối chuẩn
# Giả sử tr bình chiều cao nam giới là 170cm và độ lệch
set.seed(123)
heights <- rnorm(n=100, mean=170, sd =10)

head(heights,10)

hist(heights, breaks = 20, main = "Phân phối chiều cao",
     xlab = "Chiều cao (cm)", ylab="Số lượng", col="skyblue", border="white")

