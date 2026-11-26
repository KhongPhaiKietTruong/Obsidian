## Định Nghĩa 
Ovefitting là hiện tượng khi mô hình uốn éo quá mức (học cả những [[Outliers]] và nhiễu) để có thể khớp các điểm dữ liệu trên tập [[Training Set]], nhưng khi đưa dữ liệu mới vào để dự đoán thì mô hình dự đoán rất tệ ([[Generalization]] kém)
Hiện tượng này còn được gọi là high variance bởi vì nếu như ta thay đổi một vài điểm dữ liệu trong tập huấn luyện thôi thì hình dạng đồ thị của model sẽ cho ra hoàn toàn khác (w và b có độ biến động cao - phương sai lớn)
## Nhận Biết:
hiện tượng này có thể nhận biết được thông qua tính [[Training Loss]] và [[Val Error]], nếu tranning loss mà thấp nhưng validation loss cao thì nghĩa là model đang bị overfitting (xem thêm [[Degree Of Polynomial]]). 

một cách khác để biết mô hình có overfitting không là ta dựa trên [[Baseline Error]], nếu khoảng cách giữa training error và baseline error là nhỏ (training error ~ baseline error) và validation error nằm cách xa training error thì mô hình đang bị overfit 
## Khắc Phục 
- tăng kích thước [[Training Set]] (thu thập thêm hoặc tăng cường dữ liệu)
- khi tập huấn luyện quá ít mà [[Features]] quá nhiều thì [[Features Selection]] là giải pháp tốt 
- Giảm quy mô mô hình 
-  thực hiện [[Regularization]] như [[Vanilla Drop Out]], [[Weight Decay]], ... 
- thực hiện [[Normalization]] 

## Ứng Dụng 
ta có thể sử dụng hiện tượng này để test xem một mô hình có đang học bằng cách lấy ra một phần nhỏ dữ liệu từ [[Training Set]] 
