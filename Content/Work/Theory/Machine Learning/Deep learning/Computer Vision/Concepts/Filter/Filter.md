tên khác: kernel

## Định nghĩa 

là một [[Matrix (Ma Trận)]] được dùng trong [[Convolve (Tích Chập)]] để nhận diện những pattern nhất định trong ảnh (như cạnh dọc, ngang, cong, ...) 

ví dụ, filter xác định cạnh dọc sẽ có dạng:
$$
K = 
\begin{bmatrix}
1 & 0 & -1 \\
1 & 0 & -1 \\
1 & 0 & -1
\end{bmatrix}
$$
trong thực tế, ta không định nghĩa sẵn các giá trị trong filter, mà [[Neural Network (Mạng Neural)]] sẽ học các giá trị đó, từng phần tử trong filter cũng chính là [[Weight (Trọng Số)]] 

## Kích Thước 

kí hiệu: $f^{[l]}$ 
số **channels** của **filter** ở **lớp hiện tại** phải bằng với **số lượng filter** của **lớp trước đó** (cũng tức là **số channels** của [[Feature Tensor Z]] của **lớp trước**)

