tên khác: kernel
## Định nghĩa 

là một [[Matrix (Ma Trận)]] được dùng trong [[Convolve (Tích Chập)]] để nhận diện những pattern nhất định trong ảnh (như cạnh dọc, ngang, cong, ...) 

ví dụ, filter xác định cạnh dọc trong ảnh xám sẽ có dạng:
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
ở phần định nghĩa, ta cho ví dụ filter làm một ma trận 2 chiều vì ta xét trên ảnh xám, đối với ảnh tiêu chuẩn hiện nay, tức RGB (3 channels) thì filter sẽ cần có thêm channel nữa.
**một** filter trong [[Neural Network (Mạng Neural)]] sẽ có kích thước:
$$
(f^{[l]}, f^{[l]}, n_{c}^{[l-1]})
$$
số **channels** của **filter** ở **lớp hiện tại** phải bằng với **số channels** của [[Output Tensor Z]] do lớp trước tạo ra (cũng chính là số [[Filter]] của lớp trước đó)

## Filter quyết định số channels của feature tensor

số lượng [[Filter|filter]] ở lớp **hiện tại** sẽ quyết định **số channel** của **feature tensor** của **lớp hiện tại**  

hiểu đơn giản là mỗi lần ta tính [[Convolve (Tích Chập)|tích chập]] lên ma trận gốc, nó sẽ cho ra **một** [[Feature Map]] có **số channel là 1**, vậy thì với **n filtler** thì ta có **n feature map** với **channel = 1** 

**feature tensor** của ta sẽ là **ghép của n feature map** đó lại, tức là, **feature tensor** matrix đó sẽ có **số channels là n** 