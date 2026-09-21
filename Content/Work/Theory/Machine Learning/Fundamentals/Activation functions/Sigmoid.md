tên khác: Fogistic Function
## Định Nghĩa
là một hàm số nhận vào một số tự nhiên và trả về giá trị nằm trong khoảng \(0, 1)
$$
\sigma(z) = \frac{1}{1 + e^{-z}} 
$$
miền giá trị của sigmoid:
$$
0 < \sigma(z) < 1
$$![[Pasted image 20260921091239.png|338]]
## Đạo Hàm 
đạo hàm của hàm sigmoid có công thức:
$$\sigma'(z) = \sigma(z)(1-\sigma(z)) $$
miền giá trị của đạo hàm sigmoid là:
$$
0 < \sigma'(x) \le \frac{1}{4}
$$
## Nhược Điểm 
- dễ có hiện tượng [[Saturation]] khi dùng sigmoid trong hidden layer 
- giá trị output không phải zero-centered (tham thảo thêm [[Tại sao muốn giá trị kích hoạt zero-centered]]) 
## Trường Hợp Sử Dụng 
hàm này được sử dụng để:
- làm lớp output bài toán phân loại nhị phân 
- làm lớp output cho bài toán [[Multi-Label Classification]] 
- làm các gates trong [[LSTM]], [[GRU]], ...
## Trường Hợp Không Nên Sử Dụng 
không nên sử dụng sigmoid trong [[Hidden Layer]] vì như đã nói đã trên, nó dễ gây ra tiêu biến [[Gradient]] 
