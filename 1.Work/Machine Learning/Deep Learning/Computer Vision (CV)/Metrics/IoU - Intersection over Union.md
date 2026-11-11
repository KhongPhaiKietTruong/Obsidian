## Định Nghĩa 
IoU là một đại lượng dùng để đánh giá một [[Bounding Box]] hoặc một [[Segmentation Mask]] được dự đoán có "chính xác" hay không so với [[Ground Truth]] dựa trên tỉ lệ của phần giao với phần hợp 
Một dự đoán được xem là "đúng" (True Positive) khi IoU lớn hơn một threshold 
được tính bằng công thức:
$$IoU = \frac{\text{diện tích trùng}}{\text{diện tích hợp}}$$
![[Pasted image 20260917161141.png]]
## Công Dụng 
- có thể được sử dụng để đánh giá model trong cả hai tác vụ là [[Segmentation]] và [[Object Detection]] 