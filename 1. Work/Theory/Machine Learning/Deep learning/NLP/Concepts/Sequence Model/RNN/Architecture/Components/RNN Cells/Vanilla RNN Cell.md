## Định Nghĩa 
mỗi một RNN cell có công thức như sau:
$$
\begin{align} 
&x^{(t)}=y^{<t-1>} \\
&a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a}) \\
&\hat{y}^{<t>}=g_{2}(W_{ya}a^{<t>}+b_{y})
\end{align}
$$
ta dùng [[Activation Function]] là [[Tanh]] do có có bounded value (-1, 1) 
## Đặc Điểm 
- Mỗi một cell chứa một vector [[Activations In RNN (Hidden State)]] 
## Ưu Điểm 
không chỉ xét $x^{<t>}$ (từ hiện tại) mà còn xét cả [[Activations In RNN (Hidden State)]] của lớp trước $h^{<t-1>}$ 
## Nhược Điểm 
- sẽ xảy ra hiện tượng [[Vanishing Gradient]], do trong cell có sử dụng [[Tanh]] 

 ![[Pasted image 20260921153536.png|226]]