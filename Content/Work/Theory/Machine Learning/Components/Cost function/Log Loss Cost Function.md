dịch: hàm chi phí log loss
tên khác: Binary Cross-Entropy Cost Function

[[Cost Function (Hàm Chi Phí)]] có dạng như sau: 
$$J(\vec{w},b) = \frac{1}{m} \sum_{i=1}^{m} L\left(f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}\right)$$
với [[Loss function (Hàm Mất Mát)]] là [[Log loss (Cross-entropy Loss)]]

hàm này được sử dụng cho bài toán [[Classification]] 

phân tích hàm này như sau:
- trường hợp y=1: giả sử [[Hypothesis (hàm dự đoán)]] cho ra giá trị là 1 thì hàm loss trả về 0 tức là ta đoán đúng và nhận khoản phạt là không, còn nếu ta dự đoán tiệm cận 0 thì hàm loss trả về một số tiệm cận vô cùng (lưu ý là ta đang xét với y=1, tức đáp án đúng là y=1)
- trường hợp y=0: cũng tương tự trường hợp 1, ta đoán sai thì phạt nặng, đoán đúng thì không phạt

log loss cost function sẽ là một [[Convex Function]] 
