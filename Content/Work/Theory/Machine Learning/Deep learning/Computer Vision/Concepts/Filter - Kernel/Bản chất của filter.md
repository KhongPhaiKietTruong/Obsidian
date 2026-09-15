giả sử ta có ảnh và một filter là:
$$
I = \begin{bmatrix}
10 & 0 & -10 \\
10 & 0 & -10 \\
10 & 0 & -10 \\
\end{bmatrix}
\text{ và }
K = 
\begin{bmatrix}
1 & 0 & -1 \\
1 & 0 & -1 \\
1 & 0 & -1
\end{bmatrix}
$$
filter nảy dùng để phát hiện **cạnh dọc**

cái ma trận K mang ý nghĩa là: "lấy tổng độ sáng của 3 pixels bên trái so sánh với tổng độ sáng 3 thằng bên trái", hiểu đơn giản hơn là "so sánh phần bên trái với phần bên phải"

