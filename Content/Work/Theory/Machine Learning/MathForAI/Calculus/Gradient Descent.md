
gradient descent là một phương pháp dùng để tìm cực tiểu của một hàm số, bằng cách bắt đầu tại một vị trí bất kì, sau đó dựa trên độ dốc tại điểm đó mà quyết định nhảy tới điểm tiếp theo dựa trên công thức: 
$$
x(n+1) = x(n) - \alpha f'y(x)
$$

(hàm số 2 biến) hay (x(n+1), y(n+1)) = (x(n), y(n)) - $\alpha\nabla f$ (trong hàm số n biến) (kí hiệu này là [[Gradient]])

với a là [[Learning Rate (Tốc Độ Học)]] và $f'(x)$ là độ dốc tại điểm đó
(lí do mà ta nhảy theo độ dốc là để khi ở xa cực tiểu, ta sẽ nhảy bước dài do độ dốc cao, càng gần cực tiểu thì nhảy càng nhỏ lại)

với trường hợp đồ thị có nhiều [[Local Minimum (Cực Tiểu Cục Bộ)]] thì ta sẽ thử với nhiều điểm bắt đầu khác nhau

![[Pasted image 20260506203236.png]]