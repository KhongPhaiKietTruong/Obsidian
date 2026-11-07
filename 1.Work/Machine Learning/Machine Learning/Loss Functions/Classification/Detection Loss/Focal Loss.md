Focal Loss là một [[Loss Function]] thường được sử dụng cho bài toán [[Object Detection]] với [[Imbalanced Data]] với cơ chế tập trung vào những mẫu khó 

công thức:
$$
FL(p_t)=-\alpha_t(1-p_t)^\gamma\log(p_t)
$$
Trong đó:
- $p_t$: xác suất dự đoán đúng lớp thực tế (độ tự tin)
- $\alpha_t$: hệ số cân bằng lớp.
- $\gamma$: hệ số tập trung vào mẫu khó.
công thức này là cải tiến của [[Cross-Entropy Loss]] khi thêm vào hai thành phần: 
- Focusing factor: $(1-p_t)^\gamma$ 
mẫu dễ -> $p_t$ cao -> focusing factor nhỏ và ngược lại so với mẫu khó 
- 
