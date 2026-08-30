trong [[Gradient descent]], đôi lúc ta đi từ điểm ban đầu đến [[[[Global Minimum (Cực Tiểu Toàn Cục)]]]] theo một hướng duy nhất và với độ dài mỗi bước bé
đôi lúc thì ba đi gấp khúc với độ dài bước đi dài
adam sinh ra để tối ưu cho việc này, ở trường hợp 1, adam sẽ tăng [[Learning Rate (Tốc Độ Học)]] giúp cho bước đi của chúng ta dài hơn, trường hợp hai thì giảm lại 

một điều thú vị nữa là khi dùng adam, chúng ta sẽ có n learning rate khác nhau (n là số lượng [[Features (Đặc Trưng)]])

adam gần như là lựa chọn mặc định trong các model