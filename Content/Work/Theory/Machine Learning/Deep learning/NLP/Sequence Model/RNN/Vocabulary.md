là một bộ từ vựng mà ta sẽ định nghĩa, có thể là 10k từ, 30k, ... từ phổ biến trong tiếng anh (hoặc ngôn ngữ nào đó) được đánh số ID từ 1 đến số lượng từ, đóng vai trò để cho các từ lấy ra (tokens) từ [[Training Set (Tập Huấn Luyện)]] map vào đây 
ví dụ:
$$
vocab=\begin{bmatrix}
truong \\
anh \\
kiet \\
yeu \\
meo \\
\end{bmatrix}
$$
thì khi từ "meo yeu kiet " được [[Tokenize]], nó sẽ trở thành \[5, 4, 3]

trong vocabulary còn có thể chứa các special token như \<EOS>, \<UNK>, ... để phục vụ cho việc xử lí chuỗi 