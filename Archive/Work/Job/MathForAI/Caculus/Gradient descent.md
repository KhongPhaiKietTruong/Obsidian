gradient descent là một phương pháp dùng để tìm giá trị nhỏ nhất của một hàm số, bằng cách bắt đầu tại một vị trí bất kì, sau đó dựa trên độ dốc tại điểm đó mà quyết định nhảy tới điểm tiếp theo dựa trên công thức: 

**x(n+1) = x(n) - a.f\`(x)** (hàm số 2 biến) hay x(n+1) = x(n)- mk(trong hàm số n biến) (kí hiệu này là [[Gradient]])
với a là learning rate và f\`(x) là độ dốc tại điểm đó
(lí do mà ta nhảy theo độ dốc là để khi ở xa cực tiểu, ta sẽ nhảy bước dài do độ dốc cao, càng gần cực tiểu thì nhảy càng nhỏ lại)

với trường hợp đồ thị có nhiều cực tiểu thì ta sẽ thử với nhiều điểm bắt đầu khác nhau

![[Pasted image 20260506203236.png]]