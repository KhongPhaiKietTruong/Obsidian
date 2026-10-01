## Định Nghĩa 
L2 Regularization là loại một loại [[Regularization]] với công thức của thành phần phạt là:
$$\frac{\lambda}{2} \Vert{}\mathbf{w}\Vert{}_2^2 = \mathcal{L}_0 + \frac{\lambda}{2} \sum_{j} w_j^2$$
với:
- $\lambda$ là [[Regularization Coefficient]] (khá giống với [[Effective Learning Rate (Tốc Độ Học)]])
- m là số lượng mẫu trong [[Training Set]] 


sau khi thêm thành phần phạt vào hàm [[Cost Function]] rồi thì khi thực hiện update [[Weight (Trọng Số)]] bằng [[Gradient Descent]] cũng sẽ khiến việc update đó thay đổi
trước khi thêm regularization:
$$
w = w-\alpha\frac{ \partial J }{ \partial w } 
$$
sau khi thêm regularization:
$$
w = \left(1 - \alpha \frac{\lambda}{m}\right)w - \alpha \frac{\partial J_{origin}}{\partial w}
$$
$J_{origin}$ là hàm cost không có regularization 

cái hệ số $(1 - \alpha \frac{\lambda}{m})$ nằm trước W sẽ thường là một giá trị cận 1 (như 0.98, 0.99), giúp "kiềm chế" lại dần dần để W không quá to, quá trình này được gọi là **weight decay** 


> [!NOTE] Notes
> Khi dùng [[Stochastic Gradient Descent (SGD)]], L2 regularization sẽ trở thành [[Weight Decay]]
