## Định Nghĩa 
Symmetry là hiện tượng khi cả một [[Neural Network]] chỉ tương tự như một [[Neuron]] duy nhất, không thể học được các đặc trưng phức tạp 
## Nguyên Nhân 
Hiện tượng này xảy ra khi ta khởi tạo [[Weight (Trọng Số)]] của mạng cùng bằng một số giống nhau khiến cho lượng update bằng [[Gradient Descent]] của mỗi neuron là như nhau 
## Giải Pháp
Để phá vỡ được tính đối xứng, ta có thể áp dụng [[He Initialization]] hoặc [[Xavier Initialization]] 