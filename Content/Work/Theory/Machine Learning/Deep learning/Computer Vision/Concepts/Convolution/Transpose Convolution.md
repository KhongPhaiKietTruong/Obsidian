được dùng trong [[Semantic Segmentation]] 

ở convolution truyền thống thì ta đặt [[Filter]] lên input, tính toán và đặt giá trị lên output nhưng với tranpose convolution thì ta đặt input lên filter (1 pixel của input lên fxf pixel của filter), ta nhân pixel input đó cho filter (theo từng phần tử) xong đặt các giá trị đó lên output 
nếu khi đặt các giá trị từ filter lên output mà ô tại output đã có giá trị rồi thì ta cộng giá trị hiện có với giá trị mới 
![[Pasted image 20260917191155.png]]
>tác dụng lớn nhất của transpose convolution là giúp tăng kích thước [[Feature Map]]