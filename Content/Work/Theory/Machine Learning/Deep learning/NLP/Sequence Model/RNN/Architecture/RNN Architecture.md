## Định Nghĩa 
RNN là một model cho phép ta xử lí dữ liệu tuần tự như văn bản, giọng nói, ... một trong những đặc điểm quan trọng nhất của RNN là nó giữ được thông tin của những input ở trước 

## Forward Propagation
ở mỗi timestamp có ý nghĩa là "biết được **tóm tắt thông tin** tất cả những từ **vị trí hiện tại đảo về trước** và **từ target của vị trí trước**, xác suất của tất cả các từ trong vocabulary có thể xuất hiện ở vị trí **tiếp theo** là gì"

ở mỗi timestamp, thì ta truyền vào giá trị:  $x^{<t>}=y^{<t-1>}$ là [[Target Value]] tại timestamp trước, $a^{<t-1>}$ là tóm tắt thông tin của các timestamp trước (hidden state) từ đó ta tính được [[Pre-activation Value z]] của timestamp hiện tại 

công thức [[Forward Propogation (Lan Truyền Xuôi)]] trong RNN là:
$$
\begin{align} 
&x^{(t)}=y^{<t-1>} \\
&a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a}) \\
&\hat{y}^{<t>}=g_{2}(W_{ya}a^{<t>}+b_{y})
\end{align}
$$
một cách viết ngắn gọn hơn cho $a^{<t>}$:
$$
a^{(t)}=g_{1}(W_{a}[a^{<t-1>}+x^{<t>}]+b_{a})
$$
$W_{a}$ chính là ghép của hai ma trận $W_{aa}$ và $W_{aw}$ lại theo chiều dọc, còn phần trong ngoặc vuông là ghép hai [[Vector]] lại theo chiều dọc  
$$
\begin{align}
&W_a = \begin{bmatrix} W_{aa} & W_{ax} \end{bmatrix} \\
&[a^{<t-1>}+x^{<t>}]=\begin{bmatrix}
a^{\langle t-1 \rangle} \\
x^{\langle t \rangle}
\end{bmatrix}
\end{align}

$$
> Waa và Wax ở mọi timestamp là cùng một ma trận chứ không phải các ma trận khác nhau

![[Pasted image 20260919002558.png]]
<center>(đây là RNN đã bị unrolled (trải ra), bình thường thì ta chỉ biểu diễn nó là 1 block và mũi tên thể hiện sự đệ quy thôi, mỗi ô vuông là một RNN unit, xem thêm [[RNN unit]])</center>
## Hàm Loss
hàm loss được sử dụng trong RNN là [[Category Cross Entropy - Softmax Loss]] 
có dạng là 
$$
L(y^{<t>}, \hat{y}^{<t>})=-\sum_{i=1}^{n} y_{i}^{<t>}\log(y_{i}^{<t>})
$$
với:
- $y^{<t>}$ là vector [[One-hot encoding]] của target value của vị trí hiện tại 
- $\hat{y}^{<t>}$ là vector chứa xác suất xuất hiện của các từ nằm trong [[Vocabulary]] ở vị trí hiện tại
- n là tổng số từ trong vocabulary

Ví dụ vocabulary: 
$$[\text{cat}, \text{kiet}, \text{dog}, \text{apple}]$$ Giả sử ground truth là "cat": 
$$ y = \begin{bmatrix} 1 \\ 0 \\ 0 \\ 0 \end{bmatrix} $$ Model sau softmax dự đoán: 
$$ \hat{y} = \begin{bmatrix} 0.7 \\ 0.1 \\ 0.15 \\ 0.05 \end{bmatrix} $$
ta tính loss:
$$
\begin{align}
L &= -\left( 1\log 0.7 + 0\log 0.1 + 0\log 0.15 + 0\log 0.05 \right) \\
L &= -log 0.7
\end{align}
$$


