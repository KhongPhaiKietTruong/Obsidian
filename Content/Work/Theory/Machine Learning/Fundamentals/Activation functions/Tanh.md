giúp đưa miền giá trị của [[Neural]] z ([[Pre-activation Value]]) về đoạn (-1; 1)

hàm tanh có công thức như sau:
$$
\tanh(z) = \frac{e^z-e^{-z}}{e^z+e^{-z}}
$$
miền giá trị của tanh:
$$
-1 < tanh(z) < 1 
$$
hàm này có giá trị đầu ra tập trung xung quanh giá trị 0

thường dùng trong [[Vanilla RNN Unit]], [[LSTM]], [[GRU]], ... 