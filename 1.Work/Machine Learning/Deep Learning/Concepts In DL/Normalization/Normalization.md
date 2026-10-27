## Định Nghĩa 
Normalization là một kĩ thuật chuẩn hóa dữ liệu về một miền giá trị mà không làm thay đổi hình dạng phân phối của dữ liệu hay sự khác biệt giữa các điểm dữ liệu 
## Tác Dụng 
- giúp giảm thiểu [[Vanishing Gradient]], [[Exploding Gradient]] 
- giảm sự phụ thuộc vào khởi tạo trọng số 
- giúp model hội tụ nhanh hơn (làm mượt đường đi, giảm thiểu lao động zig zag )
- một số loại như [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Normalization/Activation Normalization/Batch Norm]] có hiệu ứng [[Regularization]] nhẹ do có nhiễu từ việc tính mean và variance 