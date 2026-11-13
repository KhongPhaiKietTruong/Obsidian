## Định Nghĩa
U-Net là một kiến trúc áp dụng cơ chế [[Skip Connection]] ([[Concatenation]]) gồm có 3 thành phần chính:
- Phần Nén ([[Encoder]]): bước truy xuất thông tin từ ảnh bằng [[Convolution]]
- Bottleneck: là phần kết nối giữa phần nén và phần mở 
- Phần Mở: thực hiện [[Transposed Convolution]] để khôi phục lại [[Spatial Size]] ban đầu 
![[Pasted image 20260917192028.png|586]]f
![[Pasted image 20260917192452.png|577]]
## Công Dụng
- dùng để [[Semantic Segmentation]] 
- dùng làm mạng khử nhiễu trong [[Diffusion Model]] 