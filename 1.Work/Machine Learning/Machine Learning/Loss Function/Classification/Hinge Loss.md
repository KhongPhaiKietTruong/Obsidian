## Định Nghĩa 
Hinge Loss được sử dụng chủ yếu trong [[SVM]] với yêu cầu rằng mô hình không chỉ phân loại đúng mà còn phải phân loại đúng một cách đủ tự tin 

công thức tổng quát với nhiều lớp:
$$
L_i = \sum_{j \neq y_i} \max(0, \, s_j - s_{y_i} + \Delta)
$$
Trong đó:
- $y_i$: class thực tế của sample thứ \(i\).
- $s_{y_i}$: prediction score của class đúng.
- $s_j$: prediction score của class sai thứ \(j\).
- $\Delta$: margin, thường mặc định bằng 1.