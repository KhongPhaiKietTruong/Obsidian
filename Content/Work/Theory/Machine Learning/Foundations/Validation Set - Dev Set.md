khi ta huấn luyện một mô hình, ta sẽ thử mô hình đó với nhiều [[Linear equation |phương trình tuyến tính]] khác nhau trong mỗi [[Neural]] ([[Polynomial]]) thay vì chỉ dạng cơ bản là 
$$
z = \vec{x}\vec{w}+b
$$
ta có thể thử với các dạng khác như 
$$
y = w_1x + w_2x^2 + w_3x^3 + b 
$$
hay
$$
y = w_1x_1 + w_2x_2 + w_3x_1^2 + w_4x_1x_2 + w_5x_2^2
+ w_6x_1^3 + w_7x_1^2x_2 + w_8x_1x_2^2 + w_9x_2^3 + b
$$
với mỗi lần thử ta tính ra [[Validation Error]] (điểm số của mô hình trên [[Validation Set - Dev Set]])
