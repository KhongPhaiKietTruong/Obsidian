![[Pasted image 20260918170710.png]]
công thức [[Forward Propogation (Lan Truyền Xuôi)]] trong RNN là:
$$
\begin{align}
a^{(t)}&=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a}) \\
\hat{y}^{<t>}&=g_{2}(W_{ya}a^{<t>}+b_{y})
\end{align}
$$
một cách viết ngắn gọn hơn cho $a^{<t>}$:
$$
a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a})
$$