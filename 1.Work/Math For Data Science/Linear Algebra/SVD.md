viết tắt của: Singular Value Decomposition

## Định Nghĩa
SVD là một phương pháp dùng để tách một ma trận số thực bất kì thành tích của ba ma trận 

Cho ma trận $A \in \mathbb{R}^{m \times n}$, SVD phân tách $A$ thành:$$A = U \Sigma V^T$$Trong đó:
- $U \in \mathbb{R}^{m \times m}$: Ma trận trực giao ($U^T U = I$). 
- $\Sigma \in \mathbb{R}^{m \times n}$: Ma trận đường chéo chữ nhật chứa các giá trị suy biến (singular values) $\sigma_1 \ge \sigma_2 \ge \dots \ge \sigma_{\min(m, n)} \ge 0$.
- $V^T \in \mathbb{R}^{n \times n}$: Chuyển vị của ma trận trực giao $V$ ($V^T V = I$). Các cột của $V$ gọi là right-singular vectors (các vector riêng trực chuẩn của $A^T A$).
## Ý Nghĩa Hình Học 
Bất kỳ phép biến đổi tuyến tính nào thông qua ma trận $A$ đều có thể phân rã thành 3 bước hình học cơ bản:
1. **$V^T$**: Phép xoay.
2. **$\Sigma$**: Phép co giãn dọc theo các trục tọa độ chính (với hệ số tỉ lệ là các singular values $\sigma_i$).
3. **$U$**: Phép xoay.

## Ứng Dụng 
- được dùng trong [[1.Work/Math For Data Science/Linear Algebra/PCA|PCA]]
- được dùng trong [[LoRA]] 