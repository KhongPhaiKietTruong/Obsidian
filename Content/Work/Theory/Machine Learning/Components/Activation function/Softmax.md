đây là một [[Activation Function (Hàm Kích Hoạt)]] được dùng trong **output layer** dạng toán phân loại với n nhãn (n>2)
có dạng là:
$$
a_{j}=\frac{e^{z_{j}}}{\sum_{k=1}^{K}e^{z_{k}}}
$$
với :
- K: số lượng nhãn 
- j: số thứ tự của neural đang tính

là một hàm giúp chuẩn hóa xác xuất
ví dụ như khi mà ta cho model phân biệt giữa 3 con vật: mèo, chó, gà
model cho ra điểm số của từng con như sau:
- mèo: z1=2.0
- chó: z2=1.0
- gà: z3=0.1
lưu ý: ở output layer, số lượng [[Neural]] trong layer đó sẽ bằng với số nhãn

nếu để những con số như này như ta khó dùng và khó hình dung được
nên ta dùng softmax để chuẩn hóa nó về xác suất
Kết quả sau khi qua Softmax:
- Mèo: **0.659** (65.9%)
- Chó: **0.242** (24.2%)
- Gà: **0.099** (9.9%) 

**Tổng cộng = 1.0 (100%)**.