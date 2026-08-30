##### output layer:
ta chọn hàm kích hoạt của output layer dựa trên ([[Target variable (Giá Trị Thực Tế)]])
- bài toán dự đoán có 2 nhãn -> dùng [[Sigmoid function]] (tức nhãn là 0 hoặc 1)
- bài toán có nhãn là cả số âm và dương (nhãn có thể là -2.2, -5.6, 4, 7 ,8)-> dùng [[Linear Activation Function]] (vì hàm này cho ra cả giá trị âm và dương)
- bài toàn có nhãn chỉ là số dương -> dùng [[ReLU]] 
![[Pasted image 20260830134731.png]]

##### hidden layer
lựa chọn hàm kích hoạt phổ biến nhất cho hiddent layer chính là ReLU
- bởi vì ReLU nhanh hơn Sigmoid (hàm của nó đơn giản hơn, không phải tính toán nhiều)
- đạo hàm (độ dốc) sigmoid quá nhỏ, dẫn đến việc tính gradient descent diễn ra chậm chạp ![[Pasted image 20260830140927.png]]