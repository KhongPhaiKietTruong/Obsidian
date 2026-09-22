dịch: phân phối nhị thức

Để một bài toán được coi là phân phối nhị thức, nó phải thỏa mãn các điều kiện (thường gọi là BINS):
1. **Binary:** Mỗi phép thử chỉ có hai kết quả: Thành công hoặc Thất bại.
2. **Independent:** Kết quả của phép thử này không ảnh hưởng đến phép thử khác.
3. **Number:** Số lần thử ($n$) phải được cố định từ trước.
4. **Same :** Xác suất thành công ($p$) phải giữ nguyên cho mỗi lần thử.

$$P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$$
trong đó: $\binom{n}{k}$ là hệ số nhị thức