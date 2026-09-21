viết tắt của: Rectified Linear Units 
dịch: Hàm tuyến tính chỉnh lưu 

## Định Nghĩa 
[[Activation Function]] này có dạng:
$$g(z)=max(0, z)$$
là một hàm phi tuyến tính 
## Đạo Hàm 
hàm ReLU không có đạo hàm tại z=0 nhưng một quy ước thường thấy là
$$
g'(0)=0
$$
## Trường Hợp Sử Dụng
là hàm kích hoạt thông dụng nhất cho [[Hidden Layer]]

## Ưu Điểm 
- chi phí tính toán thấp
- giảm thiểu [[Vanishing Gradient]] (do đạo hàm của z>0 )(chỉ với trường hợp z là số dương)
- sparse activation: giúp có hiệu ứng [[Regularization]] nhẹ, tăng [[Generalization]]
