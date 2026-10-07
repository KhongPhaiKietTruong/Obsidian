## Định Nghĩa 
khi đánh giá một mô hình, nếu dùng hai đại lượng [[Precision (Độ chính xác)]] và [[Recall (Độ Bao Phủ)]] thì có thể sẽ khó khăn để đánh giá xem mô hình đó có thật sự có hiệu suất tốt hay khi phải nhìn cả hai chỉ số cùng lúc, F1 score sinh ra để giải quyết vấn đề này, F1 score cho ta biết mô hình có hiệu suất tốt hay không bằng cách gộp 2 điểm số kia lại thành 1 và phóng đại giá trị của điểm số có giá trị thấp (harmonic mean)
công thức tính F1 score:
$$
F1 = \frac{2}{\frac{1}{\text{Precision}} + \frac{1}{\text{Recall}}}
$$