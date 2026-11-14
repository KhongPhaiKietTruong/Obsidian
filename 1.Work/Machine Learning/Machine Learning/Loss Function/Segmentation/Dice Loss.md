Dice Loss là một [[Loss Function]] được sử dụng cho [[Image Segmentation]] được tính toán dựa trên mức độ độ chồng lấp giữa vùng dự đoán và vùng [[Ground Truth]] 
công thức tính dice loss:
$$
 DiceLoss= 1-\frac{2|A\cap B|}{|A|+|B|} 
$$
Trong đó:
- $A$: tập hợp pixel thuộc Ground Truth.
- $B$: tập hợp pixel thuộc Prediction.
- $|A\cap B|$: số pixel được dự đoán đúng 
- $|A|, |B|$: số pixel thuộc hai vùng tương ứng.


