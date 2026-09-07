mỗi lần chỉ đưa một mẫu trong [[Training Set (Tập Huấn Luyện)]] vào [[Neural Network (Mạng Neural)]], tức là với mỗi [[Epoch]] thì ta sẽ cập nhật [[Weight (Trọng Số) w]] bằng [[Gradient Descent]] M lần (với M là số mẫu trong tập huấn luyện) 

sử dụng cách này sẽ khiến [[Cost Function (Hàm Chi Phí)]] hội tự rất lâu với vì với mỗi mẫu ta lại có một [[Gradient]] khác nhau, đường đi của ta đến [[Global Minimum (Cực Tiểu Toàn Cục)]]
sẽ rất "lắc lư"