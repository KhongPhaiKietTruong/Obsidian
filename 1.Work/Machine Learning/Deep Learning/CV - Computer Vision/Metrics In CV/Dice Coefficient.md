## Định Nghĩa 
Dice là một chỉ số dùng để đánh giá độ tương đồng giữa hai segmentation mask (một cái do model dự đoán và một cái là [[Ground Truth]]) 
công thức:
$$
Dice = \frac{2|A\cap B|}{|A|+|B|}
$$

hay:

$$
Dice = \frac{2TP}{2TP+FP+FN}
$$


## Khác Biệt So Với IoU
điểm khác biệt giữa dice so với [[IoU - Intersection over Union]] là nó nhạy hơn về độ trùng lặp do đặt trọng số là 2 

## Công Dụng 
- Thường được sử dụng trong Medical Image Analysis 
