công thức của thành phần phạt là:
$$
\frac{\lambda}{2m} \sum_{i=1}^{m} w_{j}^2
$$
với:
- $\lambda$ là [[Regularization Coefficient (Hệ Số Chuẩn Hóa)]] (khá giống với [[Learning Rate (Tốc Độ Học)]])
- m là số lượng mẫu trong [[Training Set (Tập Huấn Luyện)]] 

sau khi thêm thành phần phạt vào hàm [[Cost Function (Hàm Chi Phí)]] rồi thì khi thực hiện update [[Weight (Trọng Số)]] bằng [[Gradient descent]] cũng sẽ khiến việc update đó thay đổi
trước khi thêm regularization:
$$
w = w-\alpha\frac{ \partial J }{ \partial w } 
$$
sau khi thêm regularization:
$$
w = \left(1 - \alpha \frac{\lambda}{m}\right)w - \alpha \frac{\partial J_{origin}}{\partial w}
$$
$J_{origin}$ là hàm cost không có regularization 
cái hệ số nằm trước W sẽ thường là một giá trị cận 1 (như 0.98, 0.99), giúp "kiềm chế" lại dần dần để W không quá to, quá trình này được gọi là weight decay 