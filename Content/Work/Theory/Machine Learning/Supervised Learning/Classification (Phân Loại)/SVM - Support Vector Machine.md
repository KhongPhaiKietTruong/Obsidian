trong một đồ thị trong bài toán phân loại nhị phân, ta có thể vẽ được rất nhiều đường thẳng để phân loại dữ liệu thành 2 class

ý tưởng của SVM là tìm một đường phân loại mà sao cho khoảng các từ đường đó đến mẫu **gần nhất** của cả hai class là to nhất, hai mẫu đó còn được gọi là Support Vector 

hai support vector đó sẽ bị đi qua bởi hai đường thẳng được gọi là margin boundary:
$$
w^T x + b = 1
$$
$$
w^T x + b = -1
$$
[[Decision Boundary (Ranh Giới Quyết Định)]] thì có phương trình là:
$$
w^T x + b = 0
$$
