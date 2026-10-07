là một loại ma trận dùng để đánh giá hiệu suất của một model trong bài toán [[Multi-Class Classification]] sử dụng các metric như TP, TN, FP, FN
ma trận đó sẽ có hình dạng như sau:
$$
\text{confusion matrix} = \begin{bmatrix}
TP \ FP \\
FN \ TN
\end{bmatrix}
$$
hoặc trong dạng nhiều nhãn thì:![[Pasted image 20260913155636.png]]
những con số không nằm trên trục chính là số mẫu ta dự đoán sai 