làm mờ nhưng vẫn giữ được cạnh
nó chỉ làm mờ khi vùng đang được xét có sự tương đồng về màu sắc, còn khi có sự chênh lệch (cạnh) thì nó dừng lại 

bilateralFilter(src, d, sigmaColor, sigmaSpace\[, dst\[, borderType]]) -> dst

![[Pasted image 20260118195856.png]]
lưu ý: cách làm mờ này tính toán khác chậm, không nên dùng real time, nếu có thì cho chỉ số d (diameter) thấp