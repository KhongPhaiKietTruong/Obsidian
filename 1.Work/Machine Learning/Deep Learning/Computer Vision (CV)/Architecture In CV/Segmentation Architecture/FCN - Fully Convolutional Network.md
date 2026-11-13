## Định Nghĩa 
FCN là một kiến trúc mạng CNN sử dụng các [[Convolution Layer]] ở [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]] thay vì [[FC - Fully Connected Layer]] 

## Thành Phần 
Kiến trúc của FCN gồm 3 thành phần chính:
- [[Encoder]]: các lớp [[Convolution]] và [[Spatial Pooling]] 
- [[Decoder]]: thực hiện [[Upsampling]] 
- pixel-wise classification 
## Các Biến Thể 
FCN có nhiều thể, phổ biến nhất là:
- FCN-32s
- FCN-16s, FCN-8s: sử dụng [[Skip Connection]] (số càng nhỏ càng nhiều skip connection )
## Công Dụng 
- Dùng cho [[Semantic Segmentation]] 
![[Pasted image 20261113204715.png]]