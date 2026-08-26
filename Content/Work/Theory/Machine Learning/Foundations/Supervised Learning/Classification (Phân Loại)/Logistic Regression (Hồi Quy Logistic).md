dịch: hồi quy logistic

là thuật toán phổ biến dùng trong dạng bài [[Classification]],
[[Hypothesis (hàm dự đoán)]] của logistic regression sẽ có dạng như sau:
$$
f_{\vec{w}, b}(\vec{x})=\frac{1}{1+e^{-(\vec{w}\vec{x}+b)}}
$$
hàm này là sự kết hợp giữa [[Linear combination]]và [[Sigmoid function]]
giá trị của hàm chính là P(y=1 | x) ([[Conditional probability (xác suất có điều kiện)]] của nhãn = 1 khi biết x (các feature)) này sẽ nằm trong khoảng (0, 1) (vì đây thực chất là một sigmoid function) và giá trị này cũng chính là xác suất dự đoán (>=0,5 thì là nhãn 1 và ngược lại)



