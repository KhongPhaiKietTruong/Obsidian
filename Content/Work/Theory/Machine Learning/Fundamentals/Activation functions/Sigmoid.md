tên khác: logistic function

là một hàm số nhận vào một số tự nhiên và trả về giá trị nằm trong khoảng \(0, 1)
$$
\sigma(z) = \frac{1}{1 + e^{-z}} 
$$
$$
\sigma'(z) = \sigma(z)(1-\sigma(z)) 
$$
miền giá trị của sigmoid:
$$
0 < \sigma(z) < 1
$$
![[Pasted image 20260921091239.png|338]]
hàm này được sử dụng để:
- làm lớp output bài toán phân loại nhị phân 
- làm các gates trong [[LSTM]], [[GRU]], ...