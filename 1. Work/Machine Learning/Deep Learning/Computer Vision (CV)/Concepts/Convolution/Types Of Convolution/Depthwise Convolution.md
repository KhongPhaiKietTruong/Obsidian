## Định Nghĩa 
Depthwise Convolution là biến thể của [[Convolution]] mà ở đó, mỗi một [[Feature Map F]] nằm trong [[Output Tensor Z]] có một [[Filter]] riêng
nếu ta có 5 [[Filter]] thì [[Convolution]] bình thường cho ra 5 [[Feature Map F]] với mỗi pixel được tính trên cả 3 channel đồng thời của bức ảnh, còn depthwise convolution cũng cho ra 5 feature map, nhưng mỗi feature map đó chỉ được tính trên một channel, nói cách khác, **mỗi channel có một filter riêng**  
## Nhược Điểm 
- do được tính toán riêng trên mỗi channel, mạng sẽ không có được sự liên kết giữa các feature map (giải pháp cho vấn đề này là [[Depthwise Seperate Convolution]])