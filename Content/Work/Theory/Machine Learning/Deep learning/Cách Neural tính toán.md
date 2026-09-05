#### ta có thể chia cách tính toán của neural thành 3 cấp độ:
##### 1. Ở mức 1 neural
ở mức này thì ta từng từng neural một (xem ở [[Neural]])
##### 2. Ở mức layer 
ở mức độ này, cách ta tính sẽ dựa tên các [[Vector]] khi mà các giá trị trong vector này đại diện cho các giá trị của từng neural trong [[Layer (Lớp)]] đó, hiểu nôm na là một vector = 1  layer 
ví dụ:
layer 1 có 3 neural thì layer 1 sẽ có các vector có hình dạng (3, 1) như $\vec{z}, \vec{a},\vec{b}$
cách tính mỗi layer như sau:
$$
\vec{z^{(l)}}=W^{(l)}\vec{x}^{(l-1)}+\vec{b}^{(l)}
$$
với l là số của layer 
##### 3. Ở mức layer nhưng nhiều mẫu cùng lúc 
ở cấp 3, thay vì ta đưa vào một mẫu được biểu diễn với vector thì ta sẽ đưa vào một ma trận với n mẫu, với mỗi mẫu sẽ là một ma trận cột, nghĩa là ma trận input có hình dạng là KxN với K là số đặc trưng và N là số mẫu 
cách tính như sau:
$$
Z^{[l]} = W^{[l]}A^{[l-1]} + b^{[l]}
$$
lí do mà ta cộng vector b vào được các [[Matrix (Ma Trận)]] là nhờ vào cơ chế [[Broadcasting]]

| Mức | Thứ ta tính                 |
| --- | --------------------------- |
| 1   | một neural, một mẫu         |
| 2   | một lớp, một mẫu            |
| 3   | một lớp, nhiều mẫu cùng lúc |
