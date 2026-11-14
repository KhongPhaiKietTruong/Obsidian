## Định Nghĩa
U-Net là một kiến trúc áp dụng cơ chế [[Upsampling]] và [[Skip Connection]] ([[Concatenation]]) gồm có 3 thành phần chính:
- Phần Nén ([[Encoder]]): bước truy xuất thông tin từ ảnh bằng [[Convolution]]
- Bottleneck: là phần kết nối giữa phần nén và phần mở 
- Phần Mở: thực hiện [[Transposed Convolution]] để khôi phục lại [[Spatial Size]] ban đầu 
![[Pasted image 20260917192452.png|546]]
## Upsampling Trong U-net
Ta sử dụng upsampling thay vì phương pháp truyền thống là flatten cái [[Feature Map]] sau đó cho qua lớp [[FC - Fully Connected Layer]] có out_features = số lượng pixel của ảnh đích rồi reshape cái vector đó thành ảnh đích là vì phương pháp đó sẽ tạo ra rất rất nhiều tham số tốn nhiều tài nguyên. Thay vào đó ta sẽ upsampling cái feature map đó lên để tạo ra ảnh đích, tuy nhiên upsampling có thể gây mờ ảnh nên ta sẽ lót thêm các lớp convolution vào để model học cách khắc phục sự gây nhoè đó 
![[Pasted image 20261114160442.png|539]]
## Công Dụng
- Dùng trong các tác vụ image-to-image 
- domain conversion
- super-resolution 
- inpainting 
- dùng để [[Semantic Segmentation]] 
- dùng làm mạng khử nhiễu trong [[Diffusion Model]] 