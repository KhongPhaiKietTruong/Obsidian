Focal Loss là một [[Loss Function]] thường được sử dụng cho bài toán [[Object Detection]] với [[Imbalanced Data]] với cơ chế tập trung vào những mẫu khó 

công thức:
$$
FL(p_t)=-\alpha_t(1-p_t)^\gamma\log(p_t)
$$
Trong đó:
- $p_t$: xác suất dự đoán đúng lớp thực tế.
- $\alpha_t$: hệ số cân bằng lớp.
- $\gamma$: hệ số tập trung vào mẫu khó.