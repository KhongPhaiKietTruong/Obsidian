dịch: mức độ vẩn đục Gini 
kí hiệu: $I_{G}$
## Định Nghĩa 
Gini Impurity là một chỉ số khác giống với [[Entropy (Mức độ hỗn loạn)]] dùng để đo mức độ "không tinh khiết" của một tập dữ liệu 
## Công Thức 
$$
I_G(p) = 1 - \sum_{i=1}^{C} p_i^2
$$
có thể thấy, công thức của Gini Impurity không có log, do đó nó tính toán nhanh hơn so với entropy (có $\log_{2}$)
## Miền Giá Trị 
$$
\text{Gini impurity} \in [0, 0.5]
$$
- 0: hoàn toàn thuần khiết 
- 0.5: hỗn loạn đạt đỉnh 
## Ưu Điểm 
- chi phí tính toán thấp, tốc độ nhanh 