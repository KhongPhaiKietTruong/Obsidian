## Định Nghĩa 
là một [[Layer]] đưa giá trị [[Pre-activation Value]] về mức ổn định $\hat{z}$ trước khi truyền vào [[Activations]], nghĩa là $\hat{z}$ sẽ luôn có giá trị trung bình và phương sai gần như cố định mặc dù [[Weight (Trọng Số)]]  thay đổi do [[Gradient Descent]] thế nào đi nữa 

đầu tiên ta thực hiện [[Standardization (Z-score normalization)]] để các giá trị trong batch trở thành $\hat{z}$ có $\mu \approx 0$ và $\sigma^2 \approx 1$ , sau đó ta thực hiện chuẩn hóa:
$$
z_{BN}=\gamma \hat{z} + \beta 
$$
với:
- $\gamma$ và $\beta$ là [[Learnable Parameters (Tham Số Có Thể Học)]] 
- $\gamma^2$ sẽ quy định [[Variance (Phương Sai)]] 
- $\beta$ sẽ quy định [[Mean value (Giá Trị Trung Bình)]], giá trị này cũng khiến [[Bias]] trở nên "thừa" do khi chuẩn hóa Z-score thì ta trừ [[Pre-activation Value]] cho giá trị trung bình rồi, khi đó $\beta$ sẽ thay thế bias trở thành bias mới 
## Đặc Điểm 
- thường được sử dụng trước lớp activation 

## Batch Norm at Test Time 
trong [[Inference - Test time]], [[Batch Norm Layer]] sẽ không hoạt động giống như lúc train, khi ta truyền vào một mini-batch, thay vì sử dụng $\mu \text{ và }\sigma^2$ ([[Giá trị trung bình]] và [[Variance (Phương Sai)]]) của mini-batch hiện tại thì thay vào đó trong quá trình training, với mỗi mini-batch, ta cập nhật $\mu \text{ và } \sigma^2$ bằng [[Exponentially Weighted Average (EWA)]], sau khi training kết thúc, $\mu_{running} \text{ và } \sigma_{running}^2$ sẽ được giữ cố định để sử dụng cho batch norm ở test time 

lí do là vì nếu ta sử dụng thông số đó trong mini-batch hiện tại thì sẽ khiến [[Predicted Value]] của một mẫu có thể phụ thuộc vào các mẫu khác 
​