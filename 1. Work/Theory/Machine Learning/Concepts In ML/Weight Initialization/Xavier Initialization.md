## Định Nghĩa 
Xavier Initialization là một kĩ thuật khởi tạo dùng cho [[Neural Network]] sử dụng các hàm [[Activations]] như [[Sigmoid]] hay [[Tanh]] 
$$
W \sim N\left( 0,  \frac{2}{n_{in}+n_{out}}  \right) 
$$
## Tác Dụng 
Dùng để ngăn ngừa tình trạng [[Vanishing Gradient]] hoặc [[Exploding Gradient]] bằng cách giữ cho phương sai của [[Gradient]] và [[Activations]] không thay đổi qua từng [[Layer]] 

