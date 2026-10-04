viết tắt của: Binary Cross Entropy Loss
tên khác: log loss
## Định Nghĩa 
BCE Loss một dạng cụ thể của [[Cross-Entropy Loss]] với số lớp = 2 
BCE Loss có công thức:
$$L\left(\hat{y}\right) = \begin{cases} -\log\left(\hat{y})\right) & \text{if } y^{(i)} = 1 \\ -\log\left(1 - \hat{y})\right) & \text{if } y^{(i)} = 0 \end{cases}$$
dạng gộp:
$$L\left(\hat{y}\right) = -y^{(i)} \log\left(\hat{y})\right) - (1 - y^{(i)}) \log\left(1 - \hat{y})\right)$$

$\hat{y}$ là xác suất của model dự đoán ra  
## Cách hiểu trực quan
phân tích hàm này như sau:
- trường hợp y=1: giả sử [[Hypothesis]] cho ra giá trị là 1 thì hàm loss trả về 0 (log của 1 = 0) tức là ta đoán đúng và nhận khoản phạt là không, còn nếu ta dự đoán tiệm cận 0 thì hàm loss trả về một số tiệm cận vô cùng (lưu ý là ta đang xét với y=1, tức đáp án đúng là y=1)
- trường hợp y=0: cũng tương tự trường hợp 1, ta đoán sai thì phạt nặng, đoán đúng thì không phạt
