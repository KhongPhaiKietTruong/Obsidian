tên gọi khác: hyperbolic tangent function 
## Định Nghĩa
là hàm kích hoạt giúp đưa miền giá trị của [[Pre-activation Value]] về đoạn (-1; 1)
![[Pasted image 20260921143511.png|307]]
hàm tanh có công thức như sau:
$$
\tanh(z) = \frac{e^z-e^{-z}}{e^z+e^{-z}}
$$
miền giá trị của tanh:
$$
-1 < tanh(z) < 1 
$$
người ta quy ước rằng:
$$tanh(0)=0$$
hàm này có giá trị đầu ra tập trung xung quanh giá trị 0 (tham khảo thêm [[Tại sao muốn giá trị kích hoạt zero-centered]])
## Đạo Hàm 
công thức đạo hàm:
$$
\tanh'(z)=1-\tanh^2(z)
$$
miền giá trị đạo hàm 
$$
0<\tanh'(z)\leq{1}
$$
## Trường Hợp Sử Dụng 
thường dùng trong [[Vanilla RNN Cell]], [[LSTM]], [[GRU]], ... 
- dùng để tính candidate hidden state trong [[GRU]] 
- tạo candidate cell state và hidden state trong [[LSTM]]
## Ưu Điểm
giá trị của tanh là zero-centered (tham khảo thêm [[Tại sao muốn giá trị kích hoạt zero-centered]]) 

## Nhược Điểm 
- dễ xảy ra hiện tượng [[Saturation]] -> gây ra [[Vanishing Gradient]] khi dùng làm [[Activation Function]] cho [[Hidden Layer]] 

## Mối Quan Hệ Với [[Sigmoid]]
tanh về cơ bản là một hàm sigmoid được scale và dịch để ouput là zero-centered:
<center>tanh(x)=2σ(2x)−1</center>
