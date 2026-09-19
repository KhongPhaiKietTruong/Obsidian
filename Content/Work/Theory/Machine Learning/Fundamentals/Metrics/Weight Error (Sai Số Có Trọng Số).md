khi các chỉ số đánh giá nhu [[Precision (Độ chính xác)]], [[Recall (Độ Bao Phủ)]] hay [[F1 Score]] không thể đánh giá được hết những điều mà ta thật sự quan tâm trong thực tế của model 
(những điều mà ta quan tâm trong đời sống thực tế ví dụ như là chuẩn đoán từ có bệnh sang không có bệnh (false negative) sẽ gây hậu quả rất lớn)
vậy thì ta cần có một đại lượng đánh giá thể hiện được điều đó và đại lượng này ta sẽ cho trọng số của việc một dự đoán là FN có hệ số lớn để thể hiện được mức độ quan tâm của ta đến vấn đề đó 
ví dụ:
$$
errro = 0.3FP+0.7FN
$$
(đây chỉ là công thức giả sử thôi, trong thực tế ta còn quan tâm đến vấn đề khác nữa chứ không chỉ là FN không (bản chất thì chỉ số Recall đã quan tâm đến FN rồi))