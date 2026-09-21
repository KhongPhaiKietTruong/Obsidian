 ![[Pasted image 20260919005957.png|260]]
## Định Nghĩa 
mỗi một RNN cell có công thức như sau:
$$
\begin{align} 
&x^{(t)}=y^{<t-1>} \\
&a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a}) \\
&\hat{y}^{<t>}=g_{2}(W_{ya}a^{<t>}+b_{y})
\end{align}
$$
## Nhược Điểm 
- sẽ xảy ra hiện tượng [[Vanishing Gradient]], do trong cell có sử dụng [[Tanh]] 

 