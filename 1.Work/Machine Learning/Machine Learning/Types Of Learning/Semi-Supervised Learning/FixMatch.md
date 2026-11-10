## 1. Định Nghĩa
FixMatch là một phương pháp [[Semi-Supervised Learning]] kết hợp hai kỹ thuật cốt lõi:
1. **[[Consistency Regularization]]**
2. **[[Pseudo-Labeling - Self-Training]]**
## 2. Cơ Chế Hoạt Động 
Quy trình huấn luyện trong mỗi mini-batch gồm 2 nhánh song song:
### A. Nhánh có nhãn
- Áp dụng weak augmentation thông thường (như random flip, crop).
- sử dụng [[Cross-Entropy Loss]]
### B. Nhánh không nhãn
Với mỗi mẫu không nhãn $u_b$:
1. **Tạo 2 phiên bản:**
   - **Weak augmentation:** Crop, flip cơ bản.
   - **Strong augmentation:** Biến đổi mạnh bằng RandAugment
1. **Tạo Pseudo-label:** Đưa biến thể nhẹ qua mô hình để lấy phân phối xác suất, nếu dự đoán có confidence vượt ngưỡng đặt ra thì lấy dự đoán đó làm pseudo-label 
2. **Tính Unsupervised Loss:** ép dự đoán trên bản biến thể mạnh $\mathcal{A}(u_b)$ phải khớp với pseudo-label:
## 3. Tổng Hàm Mất Mát
$$
\mathcal{L} = \mathcal{L}_s + \lambda_u \mathcal{L}_u
$$
- $\mathcal{L}_s$: Supervised Cross-Entropy loss.
- $\mathcal{L}_u$: Unsupervised consistency loss.
- $\lambda_u$: Hệ số cân bằng (thường đặt mặc định $\lambda_u = 1$, rất ít phải tinh chỉnh).