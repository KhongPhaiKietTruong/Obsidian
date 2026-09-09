[[Method (Phương thức)]] này dùng để tính [[Partial Derivative (Đạo Hàm Riêng)]] của hàm số đối với từng [[Parameters (Tham số)]] học được trong [[Neural Network (Mạng Neural)]]

ví dụ: loss=n thì loss.backward() sẽ tính 
$$
\text{model.weight.grad}= \begin{bmatrix}
\frac{ \partial J_{batch} }{ \partial w_{1} }  \\
\frac{ \partial J_{batch} }{ \partial w_{2} } 
\end{bmatrix} 
$$
$$
\text{model.bias.grad}= \frac{ \partial J_{batch} }{ \partial b }
$$

lưu ý: W = $R^{N^{[l]}, N^{[l-1]}}$ thì $\frac{ \partial J_{batch} }{ \partial W }$ cũng có hình dạng giống vậy
với:
- $N^{[l]}$ là số [[Neural]] của lớp thứ l trong mạng 