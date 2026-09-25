dịch: hồi quy logistic
## Định Nghĩa 
là thuật toán phổ biến dùng trong dạng bài [[Classification]], output của nó là xác suất của các nhãn 
[[Hypothesis]] của logistic regression sẽ có dạng như sau:
$$
f_{\vec{w}, b}(\vec{x})=\frac{1}{1+e^{-(\vec{w}\vec{x}+b)}}
$$
hàm này là sự kết hợp giữa [[Linear Combination (Tổ Hợp Tuyến Tính)]] và [[Sigmoid]]
giá trị của hàm chính là P(y=1 | $\vec{x};\vec{w};b$) ([[Conditional probability]] của nhãn = 1 khi biết $\vec{x}$ (các feature), $\vec{w}$ (các trọng số) và [[Bias|Bias]]) này sẽ nằm trong khoảng (0, 1) (vì đây thực chất là một sigmoid function) và giá trị này cũng chính là xác suất dự đoán (>=0,5 thì là nhãn 1 và ngược lại)
## Cách Hiểu Trực Quan 
lí do mà có sự xuất hiện của [[Linear Regression]] ở đây (y = $\vec{w}\vec{x}+b$) là vì đây là "điểm số" để đánh giá một mẫu dữ liệu
giả sử ta đang thực hiện một mô hình đánh giá xem học sinh có đậu đại học hay không với 3 [[Features]] là (số giờ học ; số bài tập đã làm ; số buổi cúp học), từ những đặc trưng này, ta áp dụng hồi quy tuyến tính là để xem mức độ quan trọng (trọng số) của từng đặc trưng đóng góp vào việc học sinh đó có đậu đại học hay không, từ đó cho ra một con số, con số này không phải là xác suất hs đó có đậu hay không mà là điểm số của học sinh đó (điểm càng cao thì khả năng đậu càng cao và ngược lại) tuy nhiên để điểm số như vậy thì khó để có cái nhìn trực quan như khi để xác suất có giá trị từ (0,1), đó là ví do ta thêm hàm sigmoid vào để biến những điểm số thành xác suất 

