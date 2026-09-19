
khi ở dạng vector thì [[Weight (Trọng Số)]] được biểu diễn theo **cột**, khi biểu diễn thành ma trận thì biến các w cột thành **hàng** và xếp lên nhau 
$$
W^{[l]} =
\begin{bmatrix}
---(w_1^{[l]})^T--- \\
---(w_2^{[l]})^T--- \\
\vdots \\
---(w_{n^{[l]}}^{[l]})^T---
\end{bmatrix}
$$

$$
W^{[l]} \in \mathbb{R}^{n^{[l]} \times n^{[l-1]}}
$$
với:
- l là số thứ tự layer 
- $n^{[l]}$ là số neural tại layer thứ l

hiểu đơn giản là **số hàng** của ma trận W sẽ là **số neural của layer hiện tại** và **số cột** là **số neural của layer trước**, nghĩa là hình dạng của ma trận w là 
$$
(n^{(l)}, n^{(l-1)})
$$

trường hợp ma trận W của layer 1, ta biết rằng layer 0 chính là các input ([[Features]]) thì có thể hiểu hình dạng của W theo kiểu:
$$
(\text{số neural hiện tại},  \text{ số đặc trưng lớp trước (số đặc trưng)})
$$
trường hợp input là hình ảnh thì ma trận W sẽ là:
$$
(\text{số neural hiện tại, W}\times H\times 3)
$$

> [!NOTE] lưu ý
> có thể hiểu nôm na rằng nỗi neural là một đặc trưng ẩn 



