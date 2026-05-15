dịch: định thức

định thức của một ma trận là tỉ lệ thay đổi diện tích của một vùng không gian (thường là hình vuông đơn vị được tạo bởi $\hat{i}$ và $\hat{j}$ ) sau khi thực hiện phép biến đổi với ma trận đó

định thức của một ma trận A 2x2 
$$
A = 
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
có thể tính bằng công thức:
$$
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix}
= ad - bc
$$
hay det(A) = ad - bc (huyền trừ sắc)

công thức này được suy ra bằng cách: giả sử ma trận A là suy biến, nghĩa là nó ép chiều không gian xuống chiều thấp hơn, khiến cho hình vuông đơn vị từ có diện tích thành diện tích = 0, có nghĩa là det(A) = 0 

liên hệ với việc một ma trận là suy biến nếu như nó mang thông tin trùng lặp, vậy nên ta có:

$$
\begin{aligned}
    & \begin{bmatrix} a & b \end{bmatrix} = k \cdot \begin{bmatrix} c & d \end{bmatrix} \\
    \iff & \begin{cases} a = kc \\ b = kd \end{cases} \\
    \iff & \begin{cases} \frac{a}{c} = k \\ \frac{b}{d} = k \end{cases} \\
    \iff & \frac{a}{c} = \frac{b}{d} \\
    \iff & ad - bc = 0
\end{aligned}
$$


vậy là ta đã chứng minh được cách tính định thức với ma trận 2x2, còn với ma trận cao hơn thì sẽ có cách phức tạp hơn 

 det($A^{-1}$) = $\frac{1}{\det(A)}$
 
