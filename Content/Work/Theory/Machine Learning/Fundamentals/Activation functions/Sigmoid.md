tên khác: logistic function

## Định Nghĩa
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
$$![[Pasted image 20260921091239.png|338]]
## Nhược Điểm 
dễ có hiện tượng bão hòa (saturation) khi x rất lớn hoặc rất nhỏ khiến cho đạo hàm tại điểm đó rất phẳng, tức g'(z) 
## Trường Hợp Sử Dụng 
hàm này được sử dụng để:
- làm lớp output bài toán phân loại nhị phân 
- làm các gates trong [[LSTM]], [[GRU]], ...
