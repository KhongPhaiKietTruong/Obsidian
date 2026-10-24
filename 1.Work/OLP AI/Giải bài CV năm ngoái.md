modun 1: 
- cải tiến việc đưa mọi video về cùng số lượng frames (cùng độ dài) bằng phân phối đều kể cả khi số frame 
- thêm augmentation 
- giải quyết việc chỉ lấy frame cuối cùng của baseline (bằng mean-max pooling / attetion pooling) (p/s: attention pooling đã là phiên bản nâng cấp của mean pooling rồi nên không nên dùng hai thằng này cùng lúc) **trick kaggle**: kết hợp attention pooling + max pooling 
- bật biLSTM (kích thước vector đầu ra của LSTM sẽ tăng gấp đôi) 
- áp dụng k-fold 