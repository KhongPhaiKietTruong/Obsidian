Anchor Box dùng để giải quyết vấn đề trong một ô có đến 2 điểm trung tâm của hai vật thể

ta định nghĩa sẵn n cái anchor box, rồi xét trong cái ô đó, gán anchor box đó cho vật thể có [[IoU - Intersection over Union]] của nó với anchor box cao nhất, giả sử ta có 2 anchor box thì ma trận của mỗi ô sẽ như thế này:
$$
y = \begin{bmatrix}
p_{c_{1}} \\
b_{x} \\
b_{y} \\
b_{h} \\
b_{w}  \\
c_{1} \\
\dots \\
c_{n} \\ 
p_{c_{2}} \\
b_{x} \\
b_{y} \\
b_{h} \\
b_{w}  \\
c_{1} \\
\dots \\
c_{n}
\end{bmatrix}
$$