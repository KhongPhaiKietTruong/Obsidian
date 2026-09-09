[[Method (Phương thức)]] này dùng để tính [[Partial Derivative (Đạo Hàm Riêng)]] của hàm số đối với từng [[Parameters (Tham số)]] học được trang [[Neural Network (Mạng Neural)]]

ví dụ ta có [[Tensor]] a = \[$w_{1}, w_{2}, b$] thì a.backward() sẽ tính 
$$
\text{model.weight.grad}= \frac{ \partial J_{batch} }{ \partial w_{1} } 
$$
$$
\text{model.weight.grad}= \frac{ \partial J_{batch} }{ \partial w_{2} } 
$$
$$
\text{model.weight.grad}= \frac{ \partial J_{batch} }{ \partial w_{1} } 
$$