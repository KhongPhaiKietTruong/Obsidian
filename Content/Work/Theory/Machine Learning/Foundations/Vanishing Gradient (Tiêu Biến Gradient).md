 khi ta chọn [[Activation Function (Hàm Kích Hoạt)]] là [[Sigmoid function]] cho các hiddent layer, khi ta tính [[Gradient descent]]:
$$
w = w-\alpha \frac{ \partial J }{ \partial w } 
$$
khi đó $\frac{ \partial J }{ \partial w }$ gần như bằng 0, khiến cho việc update trọng w gần như không thay đổi gì
việc này xảy ra là do, trong lan truyền ngược, gradient được tính bằng cách nhân nhiều layer lại với nhau:
$$\frac{\partial J}{\partial W_1}=\frac{\partial J}{\partial a_L}\cdot\frac{\partial a_L}{\partial a_{L-1}}\cdot\ldots\cdot\frac{\partial a_2}{\partial W_1}$$
ví dụ: 0.2×0.2×0.2×0.2×0.2=0.00032 

do đó [[Gradient]] sẽ cực kì nhỏ 