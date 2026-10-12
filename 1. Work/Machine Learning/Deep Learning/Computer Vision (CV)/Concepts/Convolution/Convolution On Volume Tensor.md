## Điều Kiện
Điều kiện để thực hiện [[Convolution]] trên [[Tensor]] có nhiều channels là số channel của [[Filter]] phải bằng với số channels trên tensor 
## Định Nghĩa 
với $n_{c}$ channels thì khi tính tích chập, ta cũng tính ra được $n_{c}$ giá trị tương ứng tích chập của mỗi lớp filter với mỗi lớp của tensor, và tổng của các giá trị đó sẽ là giá trị của phần tử đó trong [[Feature Map F]]

Nếu tensor input có **3 channels** và ta dùng **1 filter có 3 channels**, thì filter đó thực chất gồm 3 “lát”:
$$K^{(1)}, K^{(2)}, K^{(3)}$$
Tại một vị trí, ta tính:
$$
\begin{aligned}
z_1 &= X^{(1)} * K^{(1)} \\
z_2 &= X^{(2)} * K^{(2)} \\
z_3 &= X^{(3)} * K^{(3)}
\end{aligned}
$$
Mỗi phép trên cho ra **1 giá trị scalar**. Sau đó cộng lại:
$$z=z_1​+z_2​+z_3​+b$$
> [!note]
> khi thực hiện tích chập một filter có kích thước (n, n, n_c) lên tensor có kích thước (h, w, n_c) ta sẽ nhận được một [[Feature Map F]] có kích thước (x, x, 1)

