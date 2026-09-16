tên khác: feature tensor 

là [[Tensor]] mà được ghép từ nhiều ma trận [[Feature Map]] lại 

kích thước của output tensor sẽ là $(m, n_{h}^{[l]}, n_{w}^{[l]}, n_c^{[l]})$
với:
- m: số mẫu trong batch 
- $n_{h}$: chiều cao output tensor
- $n_{w}$: chiều rộng output tensor
- $n_{c}$: là số lượng channel (số [[Filter]] của lớp hiện tại)