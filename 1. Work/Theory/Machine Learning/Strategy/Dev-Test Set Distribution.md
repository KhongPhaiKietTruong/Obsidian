nếu ta làm một model phân loại mèo, khi tôi điều chỉnh model bằng ảnh mèo việt nam cho tới khi dev set cho kết quả tốt, nhưng test model trên test set là ảnh mèo ở châu âu thì điều này dẫn đến model sẽ cho ra kết quả tệ trong khi model thật sự tốt với mèo việt nam
đó là lí do cả hai dev set và test set nên có cùng distribution 

lưu ý là training set không nhất thiết phải cùng distribution với test và dev, vì ta có thể cho model train trên ảnh mèo trên toàn thế giới để nhận biết được các đặc điểm cơ bản 