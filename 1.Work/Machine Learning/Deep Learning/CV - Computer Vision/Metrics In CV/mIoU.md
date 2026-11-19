viết tắt của Mean Intersection Over Union 

## Định Nghĩa 
mIoU là trung bình các [[IoU - Intersection over Union]] trên mỗi lớp đối tượng 
Đầu tiên tính IoU riêng cho từng class:

$$
IoU_i = \frac{TP_i}{TP_i+FP_i+FN_i}
$$

Sau đó lấy trung bình:

$$
mIoU = \frac{1}{C}\sum_{i=1}^{C}IoU_i
$$
## Miền Giá Trị 
mIoU có miền giá trị trong đoạn `[0, 1]` với giá trị = 1 nghĩa là hoàn toàn chính xác 
## Công Dụng 
- được sử dụng trong bài toán [[Semantic Segmentation]] 

