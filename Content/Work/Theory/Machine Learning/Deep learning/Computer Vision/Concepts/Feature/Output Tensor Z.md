tên khác: feature tensor 

là [[Tensor]] mà được ghép từ nhiều ma trận [[Feature Map]] lại 

kích thước của output tensor sẽ là $(m, n_{h}^{[l]}, n_{w}^{[l]}, n_c^{[l]})$
với:
- m: số mẫu trong batch 
- $n_{h}$: số hàng feature map (chiều cao ảnh)
- $n_{w}$: là số cột feature map (chiều rộng ảnh)
- $n_{c}$: là số lượng channel (số [[Filter]] của lớp hiện tại)