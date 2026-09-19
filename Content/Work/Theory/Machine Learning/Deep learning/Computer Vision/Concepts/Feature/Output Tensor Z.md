tên khác: feature tensor 

là [[Tensor]] mà được ghép từ nhiều ma trận [[Feature Map F]] lại 

kích thước của output tensor sẽ là $(m, n_{h}^{[l]}, n_{w}^{[l]}, n_c^{[l]})$
với:
- m: số mẫu trong batch 
- $n_{h}$: chiều cao feature map
- $n_{w}$: chiều rộng feature map
- $n_{c}$: là số lượng channel (số [[Filter]] của lớp hiện tại)