dịch: hàm chi phí log loss
tên khác: Binary Cross-Entropy Cost Function

có dạng như sau: 
$$J(\vec{w},b) = \frac{1}{m} \sum_{i=1}^{m} L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right)$$
với [[Loss function]] là:
$$L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right) = \begin{cases} -\log\left(f_{\vec{w},b}(\vec{x}^{(i)})\right) & \text{if } y^{(i)} = 1 \\ -\log\left(1 - f_{\vec{w},b}(\vec{x}^{(i)})\right) & \text{if } y^{(i)} = 0 \end{cases}$$
dạng gộp để có thể dễ dàng code:
$$L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right) = -y^{(i)} \log\left(f_{\vec{w},b}(\vec{x}^{(i)})\right) - (1 - y^{(i)}) \log\left(1 - f_{\vec{w},b}(\vec{x}^{(i)})\right)$$

hàm này được sử dụng cho bài toán [[Classification]] 

phân tích hàm này như sau:
- trường hợp y=1: giả sử [[Hypothesis]] cho ra giá trị là 1 thì hàm loss trả về 0 tức là ta đoán đúng và nhận khoản phạt là không, còn nếu ta dự đoán tiệm cận 0 thì hàm loss trả về một số tiệm cận vô cùng (lưu ý là ta đang xét với y=1, tức đáp án đúng là y=1)
- trường hợp y=0: cũng tương tự trường hợp 1, ta đoán sai thì phạt nặng, đoán đúng thì không phạt

log loss sẽ là một [[Convex Function]] 
