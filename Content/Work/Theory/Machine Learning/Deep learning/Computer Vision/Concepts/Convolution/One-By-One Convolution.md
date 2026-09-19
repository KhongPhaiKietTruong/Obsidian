tên khác: pointwise convolution 

là hành động thực hiện [[Convolve (Tích Chập)]] lên một [[Tensor]] với [[Filter]] có kích thước 1x1x$n_{c}$ (tham khảo thêm [[Convolution On Volume Tensor (Tích Chập Trên Tensor Có Nhiều Channels)]])

tác dụng của nó là để:
- thay đổi số channels (thường là giảm) mà không làm thay đổi chiều cao và chiều rộng, để giảm chi phí tính toán 
ví dụ: biến (32, 32, 192) => (32, 32, 64), số channels giảm đi đáng kể 
- trộn thông tin giữa các channels để tạo ra [[Features]] mới 
output của việc tích chập lên một tensor nhiều chiều sẽ là một số được tạo bởi tổng các giá trị của từng channel, đó là các nó "trộn" thông tin