
##### dạng tổng quát (n nhãn)
$$L = -\sum_{j=1}^{K} y_j \log(a_j)$$
với:
- K là số nhãn 
- $a_{j}$ là kết quả dự đoán (cũng giống như $f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}$ ở dưới thôi)

##### dạng cụ thể trong bài toán dự đoán với 2 nhãn
có công thức:
$$L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right) = \begin{cases} -\log\left(f_{\vec{w},b}(\vec{x}^{(i)})\right) & \text{if } y^{(i)} = 1 \\ -\log\left(1 - f_{\vec{w},b}(\vec{x}^{(i)})\right) & \text{if } y^{(i)} = 0 \end{cases}$$
dạng gộp để có thể dễ dàng code:
$$L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right) = -y^{(i)} \log\left(f_{\vec{w},b}(\vec{x}^{(i)})\right) - (1 - y^{(i)}) \log\left(1 - f_{\vec{w},b}(\vec{x}^{(i)})\right)$$
thường được dùng trong bài toán phân loại 

$f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)})$ là  [[Hypothesis (hàm dự đoán)]] xác suất của model dự đoán ra 

phân tích hàm này như sau:
- trường hợp y=1: giả sử [[Hypothesis (hàm dự đoán)]] cho ra giá trị là 1 thì hàm loss trả về 0 (log của 1 = 0) tức là ta đoán đúng và nhận khoản phạt là không, còn nếu ta dự đoán tiệm cận 0 thì hàm loss trả về một số tiệm cận vô cùng (lưu ý là ta đang xét với y=1, tức đáp án đúng là y=1)
- trường hợp y=0: cũng tương tự trường hợp 1, ta đoán sai thì phạt nặng, đoán đúng thì không phạt
