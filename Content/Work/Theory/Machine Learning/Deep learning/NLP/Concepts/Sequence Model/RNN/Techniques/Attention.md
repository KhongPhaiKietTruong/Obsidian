kí hiệu: $\alpha^{<t,t'>}$: giá trị attention mà $y^t$ nên "để ý" tới $a^{t'}$  ![[Pasted image 20260920164133.png]]
khi ta dùng [[Sequence To Sequence Model]], mỗi một token được tạo ra phải được truyền vào [[Activations In RNN (Hidden State)]] của cả chuỗi input, điều này hoạt động tốt khi chuỗi input ngắn, nhưng khi chuỗi input dài sẽ khiến model hoạt động kém, attention được sinh ra để giải quyết vấn đề này, ta sẽ gán các trọng số attention cho từng hidden state, mỗi khi tạo ra một token, ta chỉ xem xét những phần quan trọng trong chuỗi input mà không phải cả cái input và xem xét thêm từ mà ta dự đoán ở trước 

ví dụ cụ thể khi ta dùng attention trên [[Bidirectional RNN]], mỗi một token output ta sẽ xem xét cái giá trị:
$$
\alpha^{\langle 3,t\rangle}
\leftarrow
\left(s^{\langle 2\rangle}, a^{\langle t\rangle}\right)
$$
với:
$$
a^{\langle t\rangle}
=
\begin{bmatrix}
\overrightarrow{a}^{\langle t\rangle} \\
\overleftarrow{a}^{\langle t\rangle}
\end{bmatrix}
$$
mỗi $y^t$ sẽ có $T_{x}$ attention 