kí hiệu: F 
dịch: bản đồ đặc trưng

là ma trận kết quả của phép toán [[Convolve (Tích Chập)]] của [[Filter]] lên ảnh Input 
mỗi một phần tử trong ma trận F có thể hiểu là một [[Neural]]
kích thước của feature map sau phép tích chập:
$$
(n_h ,n_w, n_c)\times(f,f, n_c)=\left( \lfloor \frac{n_h+2p-f}{s} +1 \rfloor, \lfloor \frac{n_w+2p-f}{s} +1 \rfloor, 1 \right) 
$$
với:
- p: [[Padding Size]] 
- s: [[Stride (Bước Trượt)]] 
## Ý nghĩa
có thể hiểu rằng, mỗi phần tử trong feature map chính là một [[Pre-activation Value z]] "$z=w_{1}a_{1}+w_{2}a_{2}+...w_n a_n$" trong phương trình mạng neural thường thấy 
hoặc dễ hiểu hơn, mỗi con số trong feature map là mức độ phản ứng của filter đó với cái vùng ảnh đang xét 
