## Định Nghĩa 
Pixel Accuracy là chỉ số dùng để đánh giá một model trong tác vụ [[Segmentation]] được tính bằng tỉ lệ pixel được dự đoán đúng 
công thức:
$$
PA = \frac{TP+TN}{TP+TN+FP+FN}
$$
## Nhược Điểm 
- dễ bị "lạc quan" khi có hiện tượng [[Foreground-Background Class Imbalance]] 


