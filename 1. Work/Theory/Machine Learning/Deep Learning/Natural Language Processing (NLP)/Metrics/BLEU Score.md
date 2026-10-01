là một đại lượng dùng để đánh giá độ tốt của một chuỗi do model tạo ra

ta duyệt qua các từ trong chuỗi dự đoán, xem xem từ đó có xuất hiện trong bất cứ reference nào không (có thể có nhiều reference), nếu có thì ta tính 1 điểm, sau đó loại từ vừa match khỏi ref, rồi tiếp tục đến khi hết từ trong chuỗi dự đoán, cuối cùng, blue score của ta = số điểm / số phần tử trong chuỗi dự đoán 

metric này khá giống với [[Precision (Độ chính xác)]] 