nếu ta làm một model phân loại mèo, khi ta huấn luyện model bằng ảnh mèo việt nam cho tới khi dev set cho kết quả tốt, nhưng test model trên test set là ảnh mèo ở châu âu thì điều này dẫn đến model sẽ cho ra kết quả tệ trong khi model thật sự tốt với mèo việt nam
đó là lí do cả hai dev set và test set nên có cùng [[Data Distribution]] 

lưu ý là [[Training Set]] không nhất thiết phải cùng distribution với test và dev, vì ta có thể cho model train trên ảnh mèo trên toàn thế giới để nhận biết được các đặc điểm cơ bản 