bias nghĩa là "định kiến / độ chệch"

bias là giá trị kiểu như là giá trị dự đoán ban đầu rồi từ cái giá trị ban đầu đó, ta xét thêm các giá trị của các [[Features (Đặc Trưng)]] + trọng số của các feature (w1, w2, ..., wn) đó rồi điều chỉnh giá trị ban đầu đó để trở thành [[Predicted Value (Giá Trị Dự Đoán)|giá trị dự đoán cuối cùng]]

giả sử ta đang dự đoán giá nhà, thì bias thường sẽ là 2 tỷ vnđ
ta đang dự đoán giá của một lon coca thì bias sẽ là 10 nghìn vnđ 

cần phải phân biệt giữa bias nằm trong phương trình [[Linear Regression (Hồi Quy Tuyến Tính)]] và bias trong đánh giá mô hình:
- cái định nghĩa ở trên chính là cho b trong phương trình
- còn nếu nói bias của mô hình này quá cao, nghĩa là mô hình này đang bị định kiến (hay nói cách khác là bị [[Underfitting]], nghĩa là giá trị dự đoán trung bình của nó lệch nhiều so với giá trị thực tế 

