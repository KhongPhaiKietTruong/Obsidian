## Định Nghĩa 
IoU là một đại lượng dùng để đánh giá một [[Bounding Box]] hoặc một [[Segmentation Mask]] được dự đoán có "chính xác" hay không so với [[Ground Truth]] dựa trên tỉ lệ của phần giao với phần hợp 
## Công Thức 
IoU được tính bằng công thức:
$$IoU = \frac{\text{diện tích trùng}}{\text{diện tích hợp}}$$

## Miền Giá Trị 
IoU có giá trị trong đoạn `[0, 1]` với giá trị 1 nghĩa là dự đoán hoàn toàn chính xác 
## Công Dụng 
- có thể được sử dụng để đánh giá model trong cả hai tác vụ là [[Image Segmentation]] và [[Object Detection]]  