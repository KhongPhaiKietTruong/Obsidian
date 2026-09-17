target label: 
$$
y = \begin{bmatrix}
p_{c} \\
b_{x} \\
b_{y} \\
b_{h} \\
b_{w}  \\
c_{1} \\
\dots \\
c_{n}
\end{bmatrix}
$$
$p_{c}$: có vật thể ta đang detect trong ảnh không ? (0 hoặc 1)
$b_{x}, b_{y}$: tọa độ tâm bounding box 
$b_{h}, b_{w}$: chiều cao và rộng vật thể 
c1...cn: nhãn của vật thể (dùng [[One-hot encoding]]) 

giả sử $p_{c}=0$ thì $$
y = \begin{bmatrix}p_{c} \ ? \ ? \ ? \ ? \ ? \ ? \ ?  \end{bmatrix}$$
nghĩa ta ta không quan tâm đến các giá trị về tọa độ hay nhãn nếu như trong ảnh không có vật thể mà ta cần detect![[Pasted image 20260917131814.png|286]]