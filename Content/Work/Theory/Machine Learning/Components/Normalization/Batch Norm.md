là một kĩ thuật giúp đưa giá trị [[Pre-activation Value z]] về mức ổn định trước khi truyền vào [[Activation Function (Hàm Kích Hoạt)]]

đầu tiên ta thực hiện [[Standardization (Z-score normalization)]] để các giá trị trong batch trở thành $\hat{z}$ có $\mu \approx 0$ và $\sigma^2 \approx 1$ , sau đó ta thực hiện chuẩn hóa:
$$
z_{BN}=\gamma \hat{z} + \beta 
$$
với:
- $\gamma$ và $\beta$ là hai tham số mà [[Neural Network (Mạng Neural)]] sẽ học được trong quá trình huấn luyện cũng bằng phương pháp [[Gradient Descent]] 
- $\gamma^2$ sẽ quy định [[Variance (Phương Sai)]] 
- $\beta$ sẽ quy định [[Mean value (Giá Trị Trung Bình)]], giá trị này cũng khiến [[Bias]] trở nên "thừa" do khi chuẩn hóa Z-score thì ta trừ [[Pre-activation Value z]] cho giá trị trung bình rồi, khi đó $\beta$ sẽ thay thế bias trở thành bias mới 


​