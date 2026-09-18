## Định Nghĩa 
RNN là một model cho phép ta
ở mỗi timestamp có ý nghĩa là "biết được **tóm tắt thông tin** tất cả những từ **vị trí hiện tại đảo về trước** và **từ target của vị trí trước**, xác suất của tất cả các từ trong vocabulary có thể xuất hiện ở vị trí **tiếp theo** là gì"

ở mỗi timestamp, thì ta truyền vào giá trị:  $x^{<t>}=y^{<t-1>}$ là [[Target Value]] tại timestamp trước, $a^{<t-1>}$ là tóm tắt thông tin của các timestamp trước (hidden state) từ đó ta tính được [[Pre-activation Value z]] của timestamp hiện tại 

hàm loss được sử dụng trong RNN là [[Category Cross Entropy - Softmax Loss]] 
có dạng là 
$$
L(y^{<t>}, \hat{y}^{<t>})=-\sum_{i=1}^{n} y_{i}^{<t>}\log(y_{i}^{<t>})
$$
với:
- $y^{<t>}$ là vector [[One-hot encoding]] của target value của vị trí hiện tại 
- $\hat{y}^{<t>}$ là vector chứa xác suất xuất hiện của các từ nằm trong [[Vocabulary]] ở vị trí hiện tại
- n là tổng số từ trong vocabulary

Ví dụ vocabulary: 
$$[\text{cat}, \text{kiet}, \text{dog}, \text{apple}]$$ Giả sử ground truth là "cat": 
$$ y = \begin{bmatrix} 1 \\ 0 \\ 0 \\ 0 \end{bmatrix} $$ Model sau softmax dự đoán: 
$$ \hat{y} = \begin{bmatrix} 0.7 \\ 0.1 \\ 0.15 \\ 0.05 \end{bmatrix} $$
ta tính loss:
$$
\begin{align}
L &= -\left( 1\log 0.7 + 0\log 0.1 + 0\log 0.15 + 0\log 0.05 \right) \\
L &= -log 0.7
\end{align}
$$


