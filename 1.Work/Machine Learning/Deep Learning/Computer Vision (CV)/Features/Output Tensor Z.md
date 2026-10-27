tên khác: feature tensor 

Output Tensor là [[Tensor]] mà được ghép từ nhiều ma trận [[Feature Map F]] lại 

kích thước của output tensor sẽ là $(B, C, H, W)$
với:
- B: số mẫu trong batch 
- C: là số lượng channel (số [[Filter]] của lớp hiện tại)
- H: chiều cao feature map
- W: chiều rộng feature map