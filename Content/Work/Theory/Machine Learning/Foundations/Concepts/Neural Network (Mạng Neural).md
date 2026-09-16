là tập hợp của các [[Layer (Lớp)]], output của lớp này sẽ là input của lớp kia
![[Pasted image 20260827160937.png]]

một neural network sẽ gồm 3 thành phần chính:
**input layer**: chính là các [[Features (Đặc Trưng)]] 
**hidden layer**: là các feature ẩn sẽ được tạo nên bởi kết hợp các feature ở input layer và hidden layder ở trước đó, ví dụ ta biết chiều dài và rộng của nhà, thay vì tạo thủ công một feature mới là diện tích nhà thì trong hidden layer sẽ tự làm điều đó (sẽ có những feature ẩn giấu rất khó để chúng ta có thể hiểu được mà chỉ những hidden layer mới có thể tìm ra)
**output layer**: là tầng cho ra đáp án dự đoán cuối cùng dựa trên từng bài toán 
