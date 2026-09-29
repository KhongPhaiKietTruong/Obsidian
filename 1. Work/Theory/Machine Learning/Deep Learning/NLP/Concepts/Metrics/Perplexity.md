là một đại lượng dùng để đo mức độ "bối rối" của model khi dự đoán từ tiếp theo (khá trái ngược với confidence)

giả sử: kiet want to drink ....
- coffee: 0.3
- water: 0.3
- soda: 0.3
cả ba cái này đều có sác xuất giống nhau nên model sẽ bối rối nhiều hơn, không biếc phải chọn từ nào 

công thức tính:
$$
PP(W)=P(w_1,w_2,\ldots,w_N)^{-\frac{1}{N}}
$$
![[Pasted image 20260929134550.png|393]]