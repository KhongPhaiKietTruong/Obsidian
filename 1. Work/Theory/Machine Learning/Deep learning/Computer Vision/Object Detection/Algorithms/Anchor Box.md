Anchor Box dùng để giải quyết vấn đề trong một ô có đến nhiều điểm trung tâm của nhiều vật thể

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
bình thường thì kích thước của y là (h,w,8) nhưng nếu có n anchor thì kích thước của y sẽ là (h, w, n\*8)

>[!notes]
nếu ta sử dụng n anchor box thì với mỗi ô ảnh ta xét sẽ cho ra n bounding box dù cho ô ảnh đó có vật thể cần detect hay không (những bounding box trong ô ảnh không có vật thể sẽ có $p_{c}$ rất thấp)