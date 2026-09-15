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
filter này dùng để phát hiện **cạnh dọc**

cái ma trận K mang ý nghĩa là: "lấy tổng độ sáng của 3 pixels bên trái so sánh với tổng độ sáng 3 thằng bên trái", hiểu đơn giản hơn là "so sánh phần bên trái với phần bên phải"

![[Pasted image 20260915141858.png]]

##### Hướng chuyển đổi 
còn một vấn đề nữa là sự sáng và tối giữa biên
nếu bên trái là sáng qua bên trái là tối (như ảnh trên) thì kết quả trong [[Feature Map]] F sẽ là giá trị dương và nếu ngược lại thì sẽ là âm.
giá trị là âm hay dương sẽ cho ta biết được hướng của sự chuyển đổi:
- dương: sáng sang tối
- âm: tối sang sáng 
còn |F| cho ta biết cường độ của cái biên đó 

> lưu ý là ta đang xét ở phát hiện cạnh dọc 
