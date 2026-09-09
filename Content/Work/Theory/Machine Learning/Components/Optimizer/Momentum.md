Momentum giúp kiểm soát hướng đi tốt hơn 

là kĩ thuật giúp đường đi của [[Gradient]] ít "lắc lư hơn" bằng cách cho nó nhớ những giá trị gradient trước đó thông qua [[Exponentially Weighted Average (EWA)]]
giả sử ta có lần lượt từng gradient như sau
$$

\begin{aligned}
g_1 &= (10,\,2) \\
g_2 &= (-10,\,2) \\
g_3 &= (9,\,2) \\
g_4 &= (-9,\,2)
\end{aligned}
$$
ta thấy rằng ở trục 1, ta có các giá trị 10, -10, 9, -9 -> đường đi sẽ giật rất mạnh
EWA sẽ giúp các giá trị này cancel nhau khi mà 10 và -10, 9 và -9 sẽ trung hòa, khiến cho giá trị duy chuyển của trục 1 xấp xỉ bằng 0 
còn với ở trục 2, các giá trị là 2, 2, 2, 2 đang rất ổn định, và EWA sẽ vẫn duy trì sự ổn định đó 
Momentum là sự trung hòa giữa các hướng di chuyển trong quá khứ

công thức để tính gradient theo momentum sẽ là 
$$
v_{dW}^{(t)}
=
\beta v_{dW}^{(t-1)}
+
(1-\beta)dW_t
$$
sau đó update [[Weight (Trọng Số) w]] bằng công thức:
$$
W_t
=
W_{t-1}
-
\alpha v_{dW}^{(t)}
$$
và cũng thực hiện tương tự với [[Bias]]

giá trị phổ biến của $\beta$ là 0.9 

