là quá trình sử dụng [[Neural Network (Mạng Neural)]] để thực hiện dự đoán trên mẫu mới

trong quá trình training thì ta thực hiện cả [[Forward Propogation (Lan Truyền Xuôi)]] để cho ra kết quả dự đoán và [[Backpropagation]] để cho model học được đặc trưng của [[Training Set (Tập Huấn Luyện)]] 

trong quá trình inference thì ta sẽ không cần backpropagtion, không cần tính loss, không cần tính gradient, không cần regularization 