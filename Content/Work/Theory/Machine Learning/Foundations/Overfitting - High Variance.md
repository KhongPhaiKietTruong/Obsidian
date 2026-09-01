dịch: quá khớp
tên khác: High [[Variance (Phương Sai)]] (mô hình cực kì nhạy cảm với dữ liệu)

là hiện tượng khi mô hình uốn éo quá mức để có thể khớp các điểm dữ liệu trên tập [[Training Set (Tập Huấn Luyện)]], nhưng khi đưa dữ liệu mới vào để dự đoán thì mô hình dự đoán rất tệ ([[Generalization]] kém)

hiện tượng này còn được gọi là high variance bởi vì nếu như ta thay đổi một vài điểm dữ liệu trong tập huấn luyện thôi thì hình dạng đồ thị của model sẽ cho ra hoàn toàn khác (w và b có độ biến động cao)

hiện tượng này còn thể nhận biết được thông qua tính [[Training Error]] và [[Validation Error]], nếu tranning error mà thấp nhưng validation error cao thì nghĩa là model đang bị overfitting (validation error cao hơn nhiều so với training error)(xem thêm [[Mối quan hệ giữa Trainning Error và Validation Error]])

giải pháp: [[Addressing Overfitting (Giải Quyết Overfitting)]]