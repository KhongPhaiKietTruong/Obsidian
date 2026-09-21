## Định Nghĩa
 SGD mỗi lần chỉ đưa một mẫu trong [[Training Set]] vào [[Neural Network]], tức là với mỗi [[Epoch]] thì ta sẽ cập nhật [[Weight]] bằng [[Gradient Descent]] M lần (với M là số mẫu trong tập huấn luyện) 

# Nhược Điểm 
- Sẽ có nhiều "nhiễu"
sử dụng cách này sẽ khiến [[Cost Function]] hội tụ rất lâu vì với mỗi mẫu ta lại có một [[Gradient]] khác nhau, đường đi của ta đến [[Global Minimum (Cực Tiểu Toàn Cục)]] sẽ rất "lắc lư"