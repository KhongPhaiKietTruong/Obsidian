dịch: hàm chi phí bình phương sai số

có công thức như sau:
$$
\begin{aligned}
J(w, b)&=\frac{1}{2m} \sum_{i=1}^{m}(y^{(i)}-\hat{y}^{(i)})^2  	\\
&=\frac{1}{2m} \sum_{i=1}^{m}(y^{(i)}-f_{w,b}(x^{(i)}))^2
\end{aligned}
$$
với:
- y là giá trị thực tế
- $\hat{y}$ là giá trị dự đoán ra
- m là số lượng mẫu 
ta chia cho 2m là để khi lấy đạo hàm cost function này, số 2 từ mũ của [[The Error (Sai Số)]] sẽ đem xuống và tụi nó triệt tiêu nhau giúp phương trình đẹp và tính toán dễ hơn nhưng không làm thay đổi bản chất bài toán

nếu ta sử dụng squared error cost function với [[Linear Regression (Hồi Quy Tuyến Tính)]] thì hàm số sẽ là một [[Convex Function]] và ta sẽ dễ dàng tìm được giá trị nhỏ nhất 

tuy nhiên, ta không thể dùng MSE cho bài toán phân loại bởi vì đồ thị của nó không phải là dạng đồ thị lồi mà là một dạng đồ thị có rất nhiều [[Local Minimum (Cực Tiểu Cục Bộ)]] khiến cho việc tìm [[Global Minimum (Cực Tiểu Toàn Cục)]] rất khó khăn  
![[Pasted image 20260826211333.png]]
