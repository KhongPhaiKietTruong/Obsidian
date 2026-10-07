viết tắt của: Low-Rank Adaption 

## Định Nghĩa 
LoRA là một phương pháp [[Fine-Tuning]] trên một phần [[Learnable Parameters (Tham Số Có Thể Học)]] thay vì tất cả tham số trong một [[Neural Network]] bằng cách phân rã [[Weight Update Matrix]] ra thành 2 ma trận nhỏ hơn (A, B) và thực hiện học trên hai ma trận đó (ma trận gốc thì đóng băng)
$$h = W \cdot x + \Delta W \cdot x = W \cdot x + B \cdot A \cdot x$$
Giả sử một layer kích thước $4096 \times 4096$, ta chọn rank $r = 8$:

- Không dùng LoRA ($\Delta W$): 
$$4096 \times 4096 = 16.777.216 \text{ tham số cần train}$$
- Dùng LoRA ($A$ và $B$):
$$\text{Số tham số} = (4096 \times 8) + (8 \times 4096) = 32.768 + 32.768 = 65.536 \text{ tham số}$$
