 khi ta chọn [[Activation Function (Hàm Kích Hoạt)]] là [[Sigmoid]] cho các hiddent layer, khi ta tính [[Gradient descent]]:
$$
w = w-\alpha \frac{ \partial J }{ \partial w } 
$$
khi đó $\frac{ \partial J }{ \partial w }$ gần như bằng 0 , khiến cho việc update trọng w gần như không thay đổi gì
việc này xảy ra là do, trong [[Backpropagation]], gradient được tính bằng cách nhân nhiều layer lại với nhau:
$$\frac{\partial J}{\partial W_1}=\frac{\partial J}{\partial a_L}\cdot\frac{\partial a_L}{\partial a_{L-1}}\cdot\ldots\cdot\frac{\partial a_2}{\partial W_1}$$
giá trị lớn nhất của $\sigma'(z)$ là 0.25 (lưu ý rằng mỗi a cũng chính là một sigmoid), nhiều cố < 1 nhân lại với nhau thì tích của chúng ngày càng nhỏ đi
ví dụ: 0.2×0.2×0.2×0.2×0.2=0.00032
và khi càng nhiều lớp hơn nữa thì giá trị càng càng nhỏ hơn nữa và gần như bằng 0 

do đó [[Gradient]] sẽ cực kì nhỏ 

còn đối với bùng nổ gradient, đây chính là đối lập của tiêu biến gradient khi nhiều số > 1 nhân lại với nhau khiến giá trị ngày càng phình to