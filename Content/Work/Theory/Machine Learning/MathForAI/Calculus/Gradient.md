
kí hiệu: $\nabla J$

gradient là một [[Vector]] chỉ về hướng dốc nhất (đỉnh cao gần nó)

giả sử:
$$
J = (w_{1}, w_{2}, w_{3})
$$
thì ta có:
$$
\nabla J = \begin{bmatrix}
\frac{ \partial J }{ \partial w_{1} }  \\ 
\frac{ \partial J }{ \partial w_{2} }  \\ 
\frac{ \partial J }{ \partial w_{3} }  \\

\end{bmatrix}
$$

gradient được tạo bởi các [[Partial Derivative (Đạo Hàm Riêng)]] của hàm số theo từng biến
ví dụ một hàm số có n biến thì vector gradient của hàm số đó sẽ có n phần tử

gradient cũng giống với việc ta tìm điểm cực trị của một hàm số nhưng thay vì một hàm số một biến thì gradient tìm "cực trị" cho hàm n biến (n>1), ở hàm một biến thì ta tìm đạo hàm rồi cho = 0, ở gradient cũng gần tương tự vậy, chỉ là ta tìm điểm để mà gradient = 0

