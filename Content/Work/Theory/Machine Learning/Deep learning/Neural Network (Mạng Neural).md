là tập hợp của các [[Layer (Lớp)]], output của lớp này sẽ là input của lớp kia
![[Pasted image 20260827160937.png]]

một neural network sẽ gồm 3 thành phần chính:
**input layer**: chính là các [[Features (Đặc Trưng)]] 
**hidden layer**: là các feature ẩn sẽ được tạo nên bởi kết hợp các feature ở input layer và hidden layder ở trước đó, ví dụ ta biết chiều dài và rộng của nhà, thay vì tạo thủ công một feature mới là diện tích nhà thì trong hidden layer sẽ tự làm điều đó (sẽ có những feature ẩn giấu rất khó để chúng ta có thể hiểu được mà chỉ những hidden layer mới có thể tìm ra)
**output layer**: là tầng cho ra đáp án dự đoán cuối cùng dựa trên từng bài toán 

cách hoạt động nôm na của mạng neural là khi mỗi mẫu đi qua mạng neural, thì mạng neural đó sẽ cho ra kết quả dự đoán, từ cái kết quả dự đoán đó ta tính ra được loss của mẫu đó, sau đó ta tính mức độ đóng góp của w vào Loss và b vào loss,  nếu như loss to (nghĩa là giá trị dự đoán cách xa so với giá trị thực) thì giá trị update ([[Gradient descent]]) của w và b cũng to theo để điều chỉnh model sao cho ra kết quả gần với mẫu hiện tại (đưa vào tất cả mẫu nên model cuối cùng sẽ là "trung hòa" giữa sự update w, b của các mẫu)