## Định Nghĩa
U-Net là một kiến trúc gồm 3 thành phần:
- Phần Nén ([[Encoder]]): bước truy xuất thông tin từ ảnh 
- Bottleneck: là phần kết nối giữa phần nén và phần mở 
- Phần Mở: 
mà phân nửa phần đầu là [[Convolution]] bình thường, phân nửa phần sau là [[Transpose Convolution]] ![[Pasted image 20260917192028.png|586]]![[Pasted image 20260917192452.png|577]]
## Công Dụng
- dùng để [[Semantic Segmentation]] 