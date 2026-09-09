gradient descent là một phương pháp dùng để tìm cực tiểu của một hàm số, bằng cách bắt đầu tại một vị trí bất kì, sau đó dựa trên độ dốc tại điểm đó mà quyết định nhảy tới điểm tiếp theo dựa trên công thức: 
$$
x(n+1) = x(n) - \alpha f'y(x)
$$

(hàm số 2 biến) hay (x(n+1), y(n+1)) = (x(n), y(n)) - $\alpha\nabla f$ (trong hàm số n biến) (kí hiệu này là [[Gradient]])

với a là [[Learning Rate (Tốc Độ Học)]] và $f'(x)$ là độ dốc tại điểm đó
(lí do mà ta nhảy theo độ dốc là để khi ở xa cực tiểu, ta sẽ nhảy bước dài do độ dốc cao, càng gần cực tiểu thì nhảy càng nhỏ lại)

với trường hợp đồ thị có nhiều [[Local Minimum (Cực Tiểu Cục Bộ)]] thì ta sẽ thử với nhiều điểm bắt đầu khác nhau

![[Pasted image 20260506203236.png]]

gradient descent được áp dụng vào việc cập nhật các tham số của [[Neural Network (Mạng Neural)]] như [[Weight (Trọng Số) w]], [[Bias]], ... 
với mỗi một batch thì ta thực hiện update tham số (xét trường hợp là w) như sau:
$$
\begin{align}
w &= w - \alpha \frac{ \partial J_{batch} }{ \partial w }  \\
&= w - \alpha  \frac{1}{B} \sum_{i=1}^{B} \frac{ \partial L_{i} }{ \partial w } 
\end{align}
$$
 với:
 - B là kích thước của một batch 
- $\alpha$ là [[Learning Rate (Tốc Độ Học)]] 
- J là [[Cost Function (Hàm Chi Phí)]] 
- $L_{i}$ là [[Loss function (Hàm Mất Mát)]] của mẫu thứ i trong batch 