## Định Nghĩa 
Receptive Field là một khái niệm dùng để ước lượng mức độ nhận biết ngữ cảnh của 1 pixel trong các [[Hidden Layer]] lên các pixel của input, nếu đủ nhiều [[Layer]], một pixel trong Feature Map có thể có khả năng nhìn thấy toàn bộ input đầu vào 

**ví dụ**: ta cho một ảnh vào một [[Neural Network]] gồm 2 layers
- layer 1 dùng 3x3 [[Filter]] cho ra [[Feature Map]] F1: 1 pixel ở F1 "nhìn thấy" được 9 pixels (3x3) ở ảnh input 
- layer 2 cũng dùng 3x3 filter cho ra F2: lúc này, mỗi pixel ở F2 nhận biết được 25 pixels (5x5) ở ảnh input 
![[Pasted image 20261009210042.png|293]]
> [!NOTE] Notes
> Lí do mà 1 pixel ở layer 2 nhận biết 5x5 thay vì 9x9 là vì phép [[Convolution]] có tính chất chồng lấn các pixel với nhau

## Kích Thước Receptive Field
Liệu receptive field càng lớn thì model càng mạnh ?
câu trả lời là tuỳ vào tác vụ, bởi vì nếu receptive field quá lớn có thể khiến model không nhìn được các đặc trưng chi tiết (đường biên, ...) mà chỉ có thể nhìn các đặc trưng tổng quát 