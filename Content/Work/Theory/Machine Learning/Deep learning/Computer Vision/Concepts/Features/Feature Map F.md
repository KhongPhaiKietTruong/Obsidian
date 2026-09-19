kí hiệu: F 
dịch: bản đồ đặc trưng

là ma trận kết quả của phép toán [[Convolution]] của [[Filter]] lên ảnh Input 
mỗi một phần tử trong ma trận F có thể hiểu là một [[Neural]]
kích thước của feature map sau phép tích chập:
$$
(n_h ,n_w, n_c)\times(f,f, n_c)=\left( \lfloor \frac{n_h+2p-f}{s} +1 \rfloor, \lfloor \frac{n_w+2p-f}{s} +1 \rfloor, 1 \right) 
$$
với:
- p: [[Padding Size]] 
- s: [[Stride]] 
## Ý nghĩa

có thể hiểu rằng, mỗi phần tử trong feature map chính là một [[Pre-activation Value]] "$z=w_{1}a_{1}+w_{2}a_{2}+...w_n a_n$" trong phương trình mạng neural thường thấy 

hoặc dễ hiểu hơn, giả sử với filter phát hiện cạnh dọc cho ra giá trị tuyệt đối cao, nghĩa là cái filter đó detect được cạnh dọc trong vùng ảnh đó, ngược lại thì cho giá trị bé
