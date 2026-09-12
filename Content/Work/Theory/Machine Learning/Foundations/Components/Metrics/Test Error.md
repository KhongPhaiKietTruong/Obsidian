đây là một đại lượng dùng để đo lường hiệu suất của model khi dự đoán thử trên dữ liệu mới xem có tốt không 
giá trị của đại lượng này cũng chính là [[Cost Function (Hàm Chi Phí)]] (nếu trong dạng hồi quy tuyến tính, không có [[Regularization (Chuẩn Hóa)]]):

$$
J(w, b)=\frac{1}{2m} \sum_{i=1}^{m}(y^{(i)}-\hat{y}^{(i)})^2
$$
, còn với dạng bài dự đoán thì ta chỉ đơn giản đếm số lượng mẫu đoán sai 