## Định Nghĩa
U-Net là một kiến trúc có áp dụng [[Skip Connection]] ([[Concatenation]]) gồm 3 thành phần:
- Phần Nén ([[Encoder]]): bước truy xuất thông tin từ ảnh bằng [[Convolution]]
- Bottleneck: là phần kết nối giữa phần nén và phần mở 
- Phần Mở: thực hiện [[Transpose Convolution]] để khôi phục lại [[Spatial Size]] ban đầu 
![[Pasted image 20260917192028.png|586]]![[Pasted image 20260917192452.png|577]]
## Công Dụng
- dùng để [[Semantic Segmentation]] 
- dùng làm mạng khử nhiễu trong [[Diffusion Model]] 