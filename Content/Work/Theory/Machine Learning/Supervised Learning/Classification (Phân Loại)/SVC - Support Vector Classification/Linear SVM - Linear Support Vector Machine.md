trong một đồ thị trong bài toán phân loại nhị phân, ta có thể vẽ được rất nhiều đường thẳng để phân loại dữ liệu thành 2 class

ý tưởng của SVM là tìm một đường phân loại mà sao cho khoảng các từ đường đó đến mẫu **gần nhất** của cả hai class là to nhất, hai mẫu hoặc nhiều mẫu đó còn được gọi là [[Support Vectors]]

[[Decision Boundary (Ranh Giới Quyết Định)]] thì có phương trình là:
$$
w^T x + b = 0
$$
margin (biên) là cái khu vực nằm giữa hai cái [[Margin Boundary]]
khoảng cách từ margin boundary đến decision boundary là $\frac{1}{||w||}$, vậy độ rộng của margin là $\frac{2}{||w||}$ 
![[Pasted image 20260913135223.png]]
