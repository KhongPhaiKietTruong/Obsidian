có công thức là: 
$$
\text{Loss} = L(a_i, y) =
\begin{cases}
-\log a_1, & \text{if } y = 1 \\
\vdots \\
-\log a_{n}, & \text{if } y = n
\end{cases}
$$
với:
- K là số nhãn 
- $a_{j}$ là kết quả dự đoán (cũng giống như $f_{\vec{w},b}(\vec{x}^{(i)}), y^{(i)}$ ở dưới thôi)
- $y_{j}$ là đáp áp thực thế  