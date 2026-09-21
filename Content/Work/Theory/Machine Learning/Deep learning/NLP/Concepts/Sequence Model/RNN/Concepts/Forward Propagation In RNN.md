ở mỗi time step có ý nghĩa là "biết được **tóm tắt thông tin** tất cả những từ ở **vị trí hiện tại đảo về trước** và **target của vị trí trước**, xác suất của tất cả các từ trong vocabulary có thể xuất hiện ở vị trí **tiếp theo** là gì"

ở mỗi timestamp, thì ta truyền vào giá trị:  $x^{<t>}=y^{<t-1>}$ là [[Target Value]] tại time step trước, $a^{<t-1>}$ là tóm tắt thông tin của các time step trước ([[Activations In RNN (Hidden State)]]) từ đó ta tính được [[Pre-activation Value]] của time step hiện tại 

công thức [[Forward Propogation]] trong RNN là:
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