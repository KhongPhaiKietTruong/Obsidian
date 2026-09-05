
khi ở dạng vector thì [[Weight (Trọng Số)]] w được biểu diễn theo cột, khi biểu diễn theo ma trận thì biến các w cột thành w hàng và xếp lên nhau 
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
với l là layer hiện tại, n là số neuron ($n^{[l]}$ là neural tại layer hiện tại)

nói nôm na là số hàng của ma trận W sẽ là số neural của layer **hiện tại** và số cột của W là số neural của layer **trước**, nghĩa là hình dạng của ma trận w là 
$$
(n^{(l)}, n^{(l-1)})
$$
ở trường hợp ma trận w của layer 1, ta biết rằng layer 0 chính là input ([[Features (Đặc Trưng)]]) còn có thể hiểu nôm na hình dạng của W là
$$
(\text{số neural hiện tại},  \text{ số đặc trưng lớp trước (số đặc trưng)})
$$
vector trọng số w của mỗi mẫu sẽ biểu diễn theo cột, tuy nhiên, khi đưa vào ma trận, nó sẽ là các hàng 
lưu ý: có thể hiểu nôm na rằng nỗi neural là một đặc trưng ẩn 