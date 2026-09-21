## Định Nghĩa
Batch Gradient Descent là cách mà ta sẽ đưa toàn bộ mẫu trong [[Training Set]] đi qua [[Neural Network]] trong một lần và thực hiện update 

nghĩa là với một [[Epoch]] thì ta sẽ thực hiện update [[Weight]] bằng [[Gradient Descent]] một lần 

## Ưu Điểm 
- có tính ổn định khi không có "nhiễu" do ta truyền cả tập vào nên đường đi khá mượt 

## Nhược Điểm 
- Chi Phí Tính Toán **Cực Lớn** do ma trận [[Weight]] rất to (xem thêm ở [[Biểu diễn ma trận trọng số W]]) và phải thực hiện [[Backpropagation]] m lần (m là số mẫu)
- cách làm này rất tốn thời gian do nếu ta có số lượng mẫu nhiều, các ma trận A sẽ rất lớn khiến việc [[Matrix multiplication (Nhân Ma Trận)]] (xem lí do ở [[Biểu diễn ma trận trọng số W]]) 