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



