## Định Nghĩa 
Mini-Batch GD là ta chia tập huấn luyện thành nhiều tập nhỏ với kích thước mỗi tập khoảng 32, 64, ... rồi đưa vào [[Neural Network]] một cách lần lượt 
khi đó, [[Cost Function]] sẽ là tập hợp của các [[Loss Function]] của các mẫu trong mini-batch này thôi chứ không phải của tất cả mẫu trong tập huấn luyện 

## Ưu Điểm
- kết hợp sự nhanh nhạy của [[Stochastic Gradient Descent (SGD)]] và sự ổn định (ít nhiễu) của [[Batch Gradient Descent (Batch GD)]] 
## Hyperparameters
b: batch size (tham khảo [[Cách chọn loại batch]])