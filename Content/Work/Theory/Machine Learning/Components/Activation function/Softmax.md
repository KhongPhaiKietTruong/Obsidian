là một hàm giúp chuẩn hóa xác xuất
ví dụ như khi mà ta cho model phân biệt giữa 3 con vật: mèo, chó, gà
model cho ra điểm số của từng con như sau:
- mèo: 2.0
- chó: 1.0
- gà: 0.1

nếu để những con số như này như ta khó dùng và khó hình dung được
nên ta dùng softmax để chuẩn hóa nó về xác suất
Kết quả sau khi qua Softmax:
- Mèo: **0.659** (65.9%)
- Chó: **0.242** (24.2%)
- Gà: **0.099** (9.9%) 

**Tổng cộng = 1.0 (100%)**.