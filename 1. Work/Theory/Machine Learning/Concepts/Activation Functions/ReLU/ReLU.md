viết tắt của: Rectified Linear Units 
dịch: Hàm tuyến tính chỉnh lưu 

## Định Nghĩa 
ReLu là một hàm [[Activations]] phi tuyến có dạng:
$$g(z)=\max(0, z)$$
![[Pasted image 20261006141824.png|347]]
## Đạo Hàm 
hàm ReLU không có đạo hàm tại z=0 nhưng một quy ước thường thấy là
$$
g'(0)=0
$$
miền giá trị của đạo hàm
$$
g'(z) \in \text{\{0, 1\}}
$$
## Trường Hợp Sử Dụng
- là hàm kích hoạt thông dụng nhất cho [[Hidden Layer]]
- dùng cho lớp output của bài toán hồi quy (khi [[Ground Truth]] là số không âm)
## Ưu Điểm 
- chi phí tính toán thấp
- giảm thiểu [[Vanishing Gradient]] (do đạo hàm của z>0 )(chỉ với trường hợp z là số dương)
- sparse activation: giúp có hiệu ứng [[Regularization]] nhẹ, tăng [[Generalization]]
## Nhược Điểm 
- Dying Relu: là hiện tượng mà [[Neuron]] cho ra giá trị [[Activations]] = 0 với gần như mọi input (xem thêm ở [[Dying Relu]]) 
- gây ra hiện tượng exploding activations