người ta thường dùng kí hiệu "X" để biểu diễn cho ma trận [[Training Set (Tập Huấn Luyện)]]

với từng một mẫu dữ liệu:
$$
x^{(1)} = \begin{bmatrix}
x_{1}^{(1)}  \\
x_{2}^{(1)}  \\
x_{3}^{(1)} \\
\dots \\
x_{n}^{(1)}
\end{bmatrix} 
$$
với n là số [[Features (Đặc Trưng)]]
ta xếp các mẫu thành một cột trong X, ta có ma trận training set như sau 
$$
X = \begin{bmatrix} 
x^{(1)} x^{(2)} ...x^{(m)}  \\
\end{bmatrix} 
$$
với m là số mẫu trong training set

hình dạng của ma trận X sẽ là (N, M) với:
- N là số đặc trưng 
- M là số mẫu

còn ma trận nhãn thì thường để ở dạng ma trận hàng:
$$
y = [{y^{(1)}, y^{(2)}}, \dots, y^{(m)}]
$$
với m là số mẫu trong training set 
hình dạng của ma trận nhãn là (1, M)

##### Lưu ý:
cách biểu diễn ở trên là để thuận tiện cho đại số tuyến tính
còn trong code (trong thư viện như scikit-learn, pytorch) thì ta biểu diễn [[Tensor]] X có hình dạng là (M, N) với:
- M là số mẫu
- N là số đặc trưng 
trong code làm vậy là để thuận tiện cho việc code hơn, khi ta muốn lấy theo batch thì chỉ cần X\[:<batch_size>] (đây chỉ là ví dụ, chứ muốn lấy batch thì đã có [[DataLoader]]) 


 