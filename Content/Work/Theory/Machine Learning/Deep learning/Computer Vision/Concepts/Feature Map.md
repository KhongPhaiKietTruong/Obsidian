kí hiệu: F 
dịch: bản đồ đặc trưng

là ma trận kết quả của phép toán [[Convolve (Tích Chập)]] của [[Filter]] lên ảnh Input 
mỗi một phần tử trong ma trận F có thể hiểu là một [[Neural]]
kích thước của feature map sau phép tích chập:
$$
(n,n, n_c)\times(f,f, n_c)=\left( \lfloor \frac{n+2p-f}{s} +1 \rfloor, \lfloor \frac{n+2p-f}{s} +1 \rfloor, 1 \right)
$$
với:
- p: [[Padding Size]] 
- s: [[Stride (Bước Trượt)]] 

