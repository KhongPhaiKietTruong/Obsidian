## Định Nghĩa 
Activation Normalization là một kĩ thuật giúp đưa giá trị [[Pre-activation Value]] về mức ổn định $\hat{z}$ trước khi truyền vào hàm [[Activations]], nghĩa là $\hat{z}$ sẽ luôn có [[Mean value (Giá Trị Trung Bình)]] và [[Variance (Phương Sai)]] gần như cố định mặc dù [[Weight]] thay đổi do [[Gradient Descent]] thế nào đi nữa 

## Sự khác biệt giữa activation normalization trong CV và trong MLP 
sự khác biệt lớn nhất là cách xác định các nhóm dữ liệu để mà tính mean và std của từng nhóm đó 