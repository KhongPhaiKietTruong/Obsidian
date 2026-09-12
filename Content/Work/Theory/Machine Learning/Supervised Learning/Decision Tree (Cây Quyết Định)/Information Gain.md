là đại lượng cho ta biết rằng cái split mà ta vừa thực hiện giảm [[Entropy (Mức độ hỗn loạn)]] đi bao nhiêu, IG giúp ta chọn được [[Features (Đặc Trưng)]] để làm decision node để thực hiện chia bằng cách chọn feature cho ra IG cao nhất, IG cũng có thể là một trong những yếu tố để ta quyết định dừng chia và biến node hiện tại thành leaf node nếu như IG không đủ lớn 
công thức tính:
$$
IG = H(\text{parent}) - \sum_{i=1}^{k} \frac{n_i}{n} H_i
$$
với:
- H(parent): entropy trước khi chia
- $H_{i}$: entropy của node con 
- $n_{i}$: số mẫu trong node con (node con nào có mẫu nhiều hơn thì sẽ tác động đến entropy nhiều hơn ($n_{i}/n$))
- n: tổng số mẫu 
hay:
 $$
 H\left(p_1^{\text{root}}\right)
-
\left(
w^{\text{left}} H\left(p_1^{\text{left}}\right)
+
w^{\text{right}} H\left(p_1^{\text{right}}\right)
\right)
 $$
ví dụ:
![[Pasted image 20260902151239.png]]