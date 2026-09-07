là một kĩ thuật giúp đưa giá trị [[Pre-activation Value]] về mức ổn định trước khi truyền vào [[Activation Function (Hàm Kích Hoạt)]]

đầu tiên ta thực hiện [[Standardization (Z-score normalization)]] để các giá trị trong batch trở thành $\hat{z}$ có $\mu \approx 0$ và $\sigma^2 \approx 0$ , sau đó ta thực hiện chuẩn hóa:
$$
z_{BN}=\gamma \hat{z} + \beta 
$$
lí do mà ta không dừng ở bước z-score normalization là vì như thế sẽ khiến z chỉ nằm trong , ta giới hạn khả năng học tập của [[Neural Network (Mạng Neural)]] 

​