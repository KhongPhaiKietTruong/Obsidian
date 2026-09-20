kí hiệu: $A^{t}$ 
là trọng số attention của một token đối với tất cả token trong cùng một chuỗi ba gồm cả chính nó, cơ chế này cho phép một token "nhìn" với các token khác 
ví dụ:
"The cat didn’t cross the street because it was tired.”
khi xử lí "it", model sẽ gán trọng số attention cao cho "cat" vì hai từ này liên quan đến nhau 

mỗi self-attention gồm 3 thành phần:
- Q (Query): tôi đang tìm gì ?
- K (Key): tôi đang chứa thông tin gì ? 
- V (Value): tôi sẽ đóng góp thông tin gì vào token đang xét nếu tôi có sự liên quan đến token đó 
cách tính mỗi thành phần:
$$
\begin{align}
&Q=W_{Q}X \\
&K=W_{K}X \\
&V=W_{V}X
\end{align}
$$
để biết được mức độ "liên quan" của một từ với những từ khác trong cùng một chuỗi, ta sẽ tính **attention score**, giả sử xét token thứ i=3:

$$
\begin{align}
&s_{31}=q_{3} \cdot k_1  \\
&s_{32}=q_{3} \cdot k_2  \\ 
&\dots \\
&s_{T_{X}1}=q_{T_{X}} \cdot k_1 
\end{align}
$$
lưu ý: đây là các phép nhân vô hướng giữa các vector (lười thêm dấu mũi tên dô q với k)
giá trị của $s_{ij}$ càng cao thì nghĩa là mức độ liên quan của token thứ i đến token thứ j cao 
công thức tính chung một lượt:
$$
QK^T = \begin{bmatrix} s_{11} & s_{12} & s_{13} \\ s_{21} & s_{22} & s_{23} \\ s_{31} & s_{32} & s_{33} \end{bmatrix}
$$
transformer không sử dụng trực tiếp giá trị này mà tiến hành scale nó (lí do vì sao thì tìm hiểu sau):
$$
\frac{QK^T}{\sqrt{d_k}}
$$
với $d_{k}$ là số chiều của cả hai vector 
giá trị sau khi scale gọi là **scaled dot product attention** 