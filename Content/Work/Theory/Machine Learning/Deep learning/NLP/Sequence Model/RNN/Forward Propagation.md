![[Pasted image 20260918170710.png]]
công thức [[Forward Propogation (Lan Truyền Xuôi)]] trong RNN là:
$$
\begin{align} \\
&x^{(t)}=y^{<t-1>} \\
&a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a}) \\
&\hat{y}^{<t>}=g_{2}(W_{ya}a^{<t>}+b_{y})
\end{align}
$$
một cách viết ngắn gọn hơn cho $a^{<t>}$:
$$
a^{(t)}=g_{1}(W_{a}[a^{<t-1>}+x^{<t>}]+b_{a})
$$
$W_{a}$ chính là ghép của hai ma trận $W_{aa}$ và $W_{aw}$ lại theo chiều dọc, còn phần trong ngoặc vuông là ghép hai [[Vector]] lại theo chiều dọc  
$$
\begin{align}
&W_a = \begin{bmatrix} W_{aa} & W_{ax} \end{bmatrix} \\
&[a^{<t-1>}+x^{<t>}]=\begin{bmatrix}
a^{\langle t-1 \rangle} \\
x^{\langle t \rangle}
\end{bmatrix}
\end{align}

$$
