kí hiệu là w
là hệ số đi kèm với x ([[Features (Đặc Trưng)]]) trong phương trình tuyến tính $z = wx + b$ nằm trong [[Neural]] 

chúng ta không thể khởi tạo các trọng số với giá trị bằng nhau vì điều này sẽ gây ra vấn đề đối xứng giữa các neural, khiến mỗi neural sẽ tính một phương trình hoàn toàn giống nhau, trả ra kết quả giống nhau khiến cho những neural này không thể học được những đặc trưng khác nhau của dữ liệu
chúng ta cần khởi tạo trọng số với những số ngẫu nhiên dương cực nhỏ bởi vì nếu như ta cho nó to, thì z cũng sẽ to và g(z) ([[Sigmoid]]) sẽ cực nhỏ khiến việc tìm [[Gradient descent]] rất chậm

tham khảo thêm [[Biểu diễn ma trận trọng số W]]