là cách huấn luyện cho model thực hiện nhiều task cùng lúc (xác định xem ảnh cho vào có mèo và có chó không) 
đáp án của mỗi mẫu trong tập dữ liệu này sẽ có dạng:
$$y^{(i)} = \begin{bmatrix}1 \\  0 \\  1 \\  0\end{bmatrix}$$
4 cái số đó là đáp án của 4 task (ví dụ có mèo có chó có gà có hưu)
[[Loss Function]] sẽ có dạng là
$$
L^{(i)}=\sum_{j=1}^{t}\lambda_{i} L^{(i)}_{j} 
$$
với:
- $\lambda$ là trọng số của mỗi task, task quan trọng thì trọng số cao 
