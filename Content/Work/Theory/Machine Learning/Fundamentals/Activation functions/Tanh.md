## Định Nghĩa
là hàm kích hoạt giúp đưa miền giá trị của [[Pre-activation Value]] về đoạn (-1; 1)

hàm tanh có công thức như sau:
$$
\tanh(z) = \frac{e^z-e^{-z}}{e^z+e^{-z}}
$$
miền giá trị của tanh:
$$
-1 < tanh(z) < 1 
$$
hàm này có giá trị đầu ra tập trung xung quanh giá trị 0 (tham khảo thêm [[Tại sao muốn giá trị kích hoạt zero-centered]])

## Trường Hợp Sử Dụng 
thường dùng trong [[Vanilla RNN Unit]], [[LSTM]], [[GRU]], ... 