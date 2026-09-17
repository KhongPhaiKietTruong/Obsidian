là cải tiến của [[Classical Sliding Window]], giúp cải thiện hiệu năng rất nhiều, ý tưởng là thay vì lấy những window to trong ảnh gốc và truyền vào mạng từng cái một thì ta sửa đổi cấu trúc của mạng với [[Convolutional Sliding Window]] rồi truyền cả tấm gốc vào luôn, kết quả cuối cùng ta nhận được chính là một ma trận chứa kết quả của từng window, mỗi ô trong ma trận là xác suất của từng nhãn  
![[Pasted image 20260917145353.png]]ở cái ma trận 2x2x4 ở góc dưới phải, mỗi một ô chính là kết quả của các window có kích thước 14x14 trên ảnh gốc (4 window) 

cách này giúp cải thiện tốc độ rất nhiều so với sliding window truyền thống vì nó chia sẻ khối lượng tính toán của các window với nhau 
![[Pasted image 20260917145622.png|376]]