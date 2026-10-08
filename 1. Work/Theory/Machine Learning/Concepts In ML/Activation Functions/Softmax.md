# Định Nghĩa
đây là một [[Activations]] được dùng trong **output layer** dạng toán phân loại với n lớp (n>2) ([[Multi-Class Classification]]), giúp biến đổi các số thực thành phân phối xác suất 
có dạng là:
$$
a_{j}=\frac{e^{z_{j}}}{\sum_{k=1}^{K}e^{z_{k}}}
$$
với :
- K: số lượng lớp  
- j: số thứ tự của neural đang tính
![[Pasted image 20260921154843.png|498]]
> lưu ý: số lượng [[Neuron]] trong layer output đó sẽ bằng với số lớp 
## Ví Dụ Cụ Thể 
ví dụ như khi mà ta cho model phân biệt giữa 3 con vật: mèo, chó, gà
model cho ra "điểm số" ([[Pre-activation Value]]) của từng con như sau:
- mèo: z1=2.0
- chó: z2=1.0
- gà: z3=0.1

nếu để những con số như này như ta khó dùng và khó hình dung được
nên ta dùng softmax để chuẩn hóa nó về xác suất
Kết quả sau khi qua Softmax:
- Mèo: 0.659 (65.9%)
- Chó: 0.242 (24.2%)
- Gà: 0.099 (9.9%) 
Tổng cộng = 1.0 (100%).

## Softmax With Temperature 
Ta để có thể cho thêm một [[Hyperparameter (Siêu Tham Số)]] là temperature:
$$P(y = i \mid z) = \frac{\exp(z_i / T)}{\sum_{j} \exp(z_j / T)}$$
siêu tham số này có tác dụng điều khiển độ "phẳng" của phân phối xác suất đầu ra của softmax, temperature có thể nhận giá trị (0, +$\infty$) 
Temperature càng cao thì model càng sáng tạo 
Giả sử mạng nơ-ron xuất ra vector logits: $z = [2.0, 1.0, 0.1]$.Với $T = 1.0$:$$z/1.0 = [2.0, 1.0, 0.1] \implies P \approx [0.659, 0.242, 0.099]$$Với $T = 0.5$ (Làm lạnh):$$z/0.5 = [4.0, 2.0, 0.2] \implies P \approx [0.866, 0.117, 0.017]$$(Token đầu tiên tăng vọt từ $66\%$ lên gần $87\%$ xác suất)Với $T = 2.0$ (Làm nóng):$$z/2.0 = [1.0, 0.5, 0.05] \implies P \approx [0.501, 0.304, 0.195]$$(Phân phối san đều hơn, khoảng cách giữa các token thu hẹp)