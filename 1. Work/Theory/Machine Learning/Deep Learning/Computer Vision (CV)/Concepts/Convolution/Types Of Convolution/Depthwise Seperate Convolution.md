## Định Nghĩa 
Depthwise Seperate Convolution = [[Depthwise Convolution]] + [[One-By-One Convolution]] (thực hiện lần lượt)
Depthwise Convolution giúp trích xuất đặc trưng không gian trên từng kênh
One-by-one giúp kết hợp thông tin nhiều kênh lại với nhau 
![[Pasted image 20260916231241.png]]
## Ưu Điểm 
- loại tích chập này tốn ít chi phí toán hơn nhiều so với tích chập thông thường 

## Sử Dụng 
- phổ biến trong [[MobileNet]] và [[EfficientNet]] 