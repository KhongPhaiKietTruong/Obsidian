tên khác: kernel tensor 
## Định nghĩa
là một tensor được tạo nên bằng cách xếp chồng $n_{c}$ [[Filter]] lên nhau
## Kích thước 
có kích thước là:
$$
(f^{(l)}, f^{(l)}, n_{c}^{[l-1]}, n_{c}^{[l]})
$$
hay trong pytorch là:
$$
(C_out, C_in, K_h, K_w)
$$

với:
- $f^{(l)}$: dài/rộng của filter
- $n_{c^{[l-1]}}$: input channels (số channel của [[Output Tensor Z]] của lớp trước tạo ra)
- $n_{c^{[l]}}$: output channels  
