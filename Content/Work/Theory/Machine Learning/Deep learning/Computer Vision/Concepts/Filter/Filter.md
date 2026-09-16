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
cái ma trận K mang ý nghĩa là: "lấy tổng độ sáng của 3 pixels bên trái so sánh với tổng độ sáng 3 thằng bên trái", hiểu đơn giản hơn là "so sánh phần bên trái với phần bên phải"
![[Pasted image 20260915141858.png|439]]
cái ma trận K mang ý nghĩa là: "lấy tổng độ sáng của 3 pixels bên trái so sánh với tổng độ sáng 3 thằng bên trái", hiểu đơn giản hơn là "so sánh phần bên trái với phần bên phải"
## Kích Thước 

kí hiệu: $f^{[l]}$ 
ở phần định nghĩa, ta cho ví dụ filter làm một ma trận 2 chiều vì ta xét trên ảnh xám, đối với ảnh tiêu chuẩn hiện nay, tức RGB (3 channels) thì filter sẽ cần có thêm channel nữa.
**một** filter trong [[Neural Network (Mạng Neural)]] sẽ có kích thước:
$$
(f^{[l]}, f^{[l]}, n_{c}^{[l-1]})
$$
số **channels** của **filter** ở **lớp hiện tại** phải bằng với **số channels** của [[Output Tensor Z]] do lớp trước tạo ra (cũng chính là số [[Filter]] của lớp trước đó)

## Filter quyết định số channels của feature tensor

mỗi một filter sẽ tạo ra một [[Feature Map]], mà [[Output Tensor Z]] của ta là ghép từ nhiều feature map, vậy tức là:
số lượng filter ở lớp **hiện tại** sẽ quyết định **số channel** của **output tensor** của **lớp hiện tại**  

hiểu đơn giản là mỗi lần ta tính [[Convolve (Tích Chập)|tích chập]] lên ma trận gốc, nó sẽ cho ra **một** [[Feature Map]] có **số channel là 1**, vậy thì với **n filtler** thì ta có **n feature map** với **channel = 1** 

**output tensor** của ta sẽ là **ghép của n feature map** đó lại, tức là, **feature tensor** matrix đó sẽ có **số channels là n** 
## Hướng chuyển đổi 
còn một vấn đề nữa là sự sáng và tối giữa biên
nếu bên trái là sáng qua bên trái là tối thì kết quả trong feature map F sẽ là giá trị dương và nếu ngược lại thì sẽ là âm.
giá trị là âm hay dương sẽ cho ta biết được hướng của sự chuyển đổi:
- dương: sáng sang tối
- âm: tối sang sáng 
còn |F| cho ta biết cường độ của cái biên đó 

> lưu ý là ta đang xét ở phát hiện cạnh dọc 

