# Định Nghĩa
đây là một [[Activation Function]] được dùng trong **output layer** dạng toán phân loại với n lớp (n>2) ([[Multi-class Classification]]), giúp biến đổi các số thực thành phân phối xác suất 
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


để sử dụng softmax hiệu quả, do một vài vấn đề liên quan đến sai số làm tròn mà người ta không để layer cuối cùng là softmax mà là 'linear' sau đó gán tham số from_logits = true (bản chất của việc này thì vẫn là dùng softmax nhưng tăng độ chính xác hơn), ở phần predict, thì ta dùng một method để chuyển đổi các con số thành xác xuất