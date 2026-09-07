là quá trình sử dụng [[Neural Network (Mạng Neural)]] để thực hiện dự đoán trên mẫu mới

trong quá trình training thì ta thực hiện cả [[Forward Propogation (Lan Truyền Xuôi)]] để cho ra kết quả dự đoán và [[Backpropagation (Lan Truyền Ngược)]] để cho model học được đặc trưng của [[Training Set (Tập Huấn Luyện)]] 

trong quá trình inference thì ta sẽ không cần backpropagtion, không cần tính [[Loss function (Hàm Mất Mát)]], không cần tính [[Gradient]], không cần regularization 