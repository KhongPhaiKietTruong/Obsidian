## Định Nghĩa
Leaky ReLU là biến thể của [[ReLU]] dùng để giảm bớt tình trạng [[Dying Relu]] 
công thức:
$$
\operatorname{LeakyReLU}(x)=\begin{cases}x, & x>0\\ \alpha x, & x\le 0\end{cases}
$$
với a là một số thực dương rất nhỏ, thường là 0.01 

 ![[Pasted image 20261006143211.png|458]]