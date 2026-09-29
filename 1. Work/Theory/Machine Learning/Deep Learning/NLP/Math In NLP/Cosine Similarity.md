là đại lượng dùng để đo sự tương quan về hướng của hai [[Vector]] 

cosine similarity có miền giá trị từ \[-1, 1]:
- -1: hai vector ngược hướng
- 0: hai vector vuông góc 
- 1: hai vector cùng hướng 

công thức tính:
$$
\cos(\theta)=\frac{A \cdot B}{||A|| ||B||}
$$
với $A \cdot B$ là [[Dot product (Tích Vô Hướng)]] của hai vector 
||A|| là [[L2-norm (Euclidean Norm)]] của vector 

đại lượng này cũng giống với [[Euclidean Distance]] nhưng để giải quyết vấn đề A=10B thì khoảng cách sẽ rất lớn nhưng hai vector này vẫn tương đồng nên ta sẽ xem xét thêm hướng của vector 

cosine similarity thường được dùng nhiều hơn euclidean 