## 1. Định Nghĩa
FixMatch là một phương pháp [[Semi-Supervised Learning]] kết hợp hai kỹ thuật cốt lõi:
1. **[[Consistency Regularization]]**
2. **[[Pseudo-Labeling - Self-Training]]**
## 2. Cơ Chế Hoạt Động 
Quy trình huấn luyện trong mỗi mini-batch gồm 2 nhánh song song:
### A. Nhánh có nhãn
- Áp dụng weak augmentation thông thường (như random flip, crop).
- sử dụng [[Cross-Entropy Loss]]
### B. Nhánh không nhãn (Unlabeled Branch)
Với mỗi mẫu không nhãn $u_b$:
1. **Tạo 2 phiên bản:**
   - **Weak augmentation $\alpha(u_b)$:** Crop, flip cơ bản.
   - **Strong augmentation $\mathcal{A}(u_b)$:** Biến đổi mạnh bằng RandAugment hoặc CTAugment kết hợp Cutout.
2. **Tạo Pseudo-label:** Đưa $\alpha(u_b)$ qua mô hình để lấy phân phối xác suất $q_b = p_m(y \mid \alpha(u_b))$.
   - Lấy nhãn dự đoán: $\hat{q}_b = \arg\max(q_b)$.
   - Kiểm tra độ tự tin: $\max(q_b) \ge \tau$ (ngưỡng threshold $\tau$, thường đặt $\tau = 0.95$).
3. **Tính Unsupervised Loss:** Nếu độ tự tin vượt ngưỡng $\tau$, ép dự đoán trên bản biến thể mạnh $\mathcal{A}(u_b)$ phải khớp với $\hat{q}_b$:
  $$\mathcal{L}_u = \frac{1}{\mu B} \sum_{b=1}^{\mu B} \mathbb{I}(\max(q_b) \ge \tau) \cdot \text{H}(\hat{q}_b, p_m(y \mid \mathcal{A}(u_b)))$$
  *(Lưu ý: Không truyền gradient qua nhánh tạo pseudo-label, tức dùng `stop_gradient` / `detach`)*.

---

## 3. Tổng Hàm Mất Mát (Total Loss)
$$
\mathcal{L} = \mathcal{L}_s + \lambda_u \mathcal{L}_u
$$
- $\mathcal{L}_s$: Supervised Cross-Entropy loss.
- $\mathcal{L}_u$: Unsupervised consistency loss.
- $\lambda_u$: Hệ số cân bằng (thường đặt mặc định $\lambda_u = 1$, rất ít phải tinh chỉnh).
- $\tau$: Ngưỡng lọc nhãn tin cậy (Confidence threshold, thường là $0.95$).

---

## 4. Tại Sao FixMatch Hiệu Quả?
- **Ngưỡng tin cậy $\tau$ (Confidence thresholding):** Giúp loại bỏ hầu hết các pseudo-label sai, ngăn ngừa hiện tượng "khuếch đại lỗi" (confirmation bias) thường gặp trong Self-Training.
- **Sức mạnh từ Strong Augmentation:** Bắt mô hình phải bất biến với các biến đổi nhiễu rất mạnh (màu sắc, biến dạng, che khuất), từ đó học được biểu diễn tổng quát hóa tốt hơn.
- **Đơn giản:** Không cần các bước phức tạp như sharpening distribution hay MixUp giữa các mẫu như MixMatch.

---

## Liên Kết Liên Quan
- [[Semi-Supervised Learning]]
- [[Consistency Regularization]]
- [[Pseudo-Labeling - Self-Training]]