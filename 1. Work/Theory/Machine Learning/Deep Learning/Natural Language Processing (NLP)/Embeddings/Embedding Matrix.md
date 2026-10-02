kí hiệu: E 

Embedding matrix là một ma trận chứa các [[Ebeddings]] của [[Embedding Vocabulary]]
số cột là số [[Features]] và số hàng là số từ trong vocab (mỗi từ là một ma trận cột): 
$$
E \in R^{V\times D}
$$
với:
- V là vocab size: số lượng từ trong [[Vocabulary]] 
- D là embedding dimiension: số chiều của embedding 
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
ta có thể lấy ra embedding của một token bằng cách nhân embedding matrix với [[One-hot encoding]] của token đó, cách này không còn được dùng thời nay nữa
$$
e = E \times o
$$
- e: embedding của từ cần tính
- E: embedding matrix 
- o: [[One-hot encoding]]

>Embedding Matrix cũng khá giống với ma trận [[Weight (Trọng Số)]] khi các giá trị trong nó sẽ được học bởi [[Neural Network]]