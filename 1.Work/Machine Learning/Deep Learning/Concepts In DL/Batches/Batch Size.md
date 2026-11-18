## Định Nghĩa 
Batch Size là số lượng mẫu trong một [[Mini-Batch Stochastic Gradient Descent (Mini-batch SGD)]], hay nói cách khác là số lượng mẫu được dùng để tính [[Gradient]] trong một lần cập nhật [[Weight]] bằng [[Gradient Descent]] 

## Cách Chọn Batch Size 
Cách chọn batch size tuỳ thuộc rất nhiều vào bài toán, batch size thường có giá trị là bội số của 8 như: 8, 16, 32, 64, ... nếu chọn batch size quá to có thể dẫn đến OOM, còn batch size quá nhỏ có thể gây nhiễu trong quá trình model học

## Mối Quan Hệ Với Learning Rate 
Batch size có mối quan hệ mật thiết với [[Base Learning Rate]] vì LR là hệ số quy định mức thay đổi của [[Weight]] sau mỗi lần cập nhật: **batch size tỉ lệ thuận với learning rate** 
$$
LR_{new} = LR_{old} \times \frac{B_{new}}{B_{old}}
$$

