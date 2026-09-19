kí hiệu: E 
là một ma trận chứa các [[Ebeddings]] của [[Embeddings Vocabulary]]
số cột là số [[Features (Đặc Trưng)]] và số hàng là số từ trong vocab (mỗi từ là một ma trận cột)

$$
E=
\begin{bmatrix}
--- & e_{\text{cat}} & ---\\
--- & e_{\text{dog}} & ---\\
--- & e_{\text{king}} & ---\\
--- & e_{\text{queen}} & ---\\
& \vdots &
\end{bmatrix}
$$
ta có thể lấy ra embeding của một token bằng cách nhân embedding matrix với [[One-hot encoding]] của token đó, cách này thường không được dùng 