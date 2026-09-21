## Định Nghĩa
là biến thể của [[ReLU]] dùng để giảm bớt tình trạng dying ReLU 
công thức:
$$
\operatorname{LeakyReLU}(x)=\begin{cases}x, & x>0\\ \alpha x, & x\le 0\end{cases}
$$
với a là một số nguyên dương rất nhỏ, thường là 0.01 

ngoài công thức ra thì những đặc điểm khác cũng khá giống với ReLU như là được sử dụng nhiều trong [[Hidden Layer]], ... 