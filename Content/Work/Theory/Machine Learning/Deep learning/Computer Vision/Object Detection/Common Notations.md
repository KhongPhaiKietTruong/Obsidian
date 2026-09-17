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
$p_{c}$: sác xuất vật thể ta đang detect trong ảnh 
$b_{x}, b_{y}$: tọa độ tâm bounding box 
$b_{h}, b_{w}$: chiều cao và rộng vật thể 
c1...cn: nhãn của vật thể (dùng [[One-hot encoding]]) 

các giá trị liên quan đến tọa độ sẽ chứa giá trị là tỉ lệ của nó so với cái ô đang xét (giá trị của b_h và b_w cũng có thể lớn hơn một nếu vật thể to hơn ô đang xét)
![[Pasted image 20260917160112.png|378]]
giả sử $p_{c}=0$ thì $$
y = \begin{bmatrix}p_{c} \ ? \ ? \ ? \ ? \ ? \ ? \ ?  \end{bmatrix}$$
nghĩa ta ta không quan tâm đến các giá trị về tọa độ hay nhãn nếu như trong ảnh không có vật thể mà ta cần detect![[Pasted image 20260917131814.png|286]]