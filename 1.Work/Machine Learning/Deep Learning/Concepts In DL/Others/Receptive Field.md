## Định Nghĩa 
Receptive Field là một khái niệm dùng để ước lượng mức độ nhận biết ngữ cảnh của 1 pixel trong các [[Hidden Layer]] lên các pixel của input, nếu đủ nhiều [[Layer]], một pixel trong Feature Map hoàn toàn có thể nhìn thấy toàn bộ bức ảnh đầu vào 

**ví dụ**: ta cho một ảnh vào một [[Neural Network]] gồm 2 layer
- layer 1 dùng 3x3 [[Filter]] cho ra [[Feature Map]] F1: 1 pixel ở F1 "nhìn thấy" được 9 pixels (3x3) ở ảnh input 
- layer 2 cũng dùng 3x3 filter cho ra F2: lúc này, mỗi pixel ở F2 nhận biết được 25 pixels (5x5) ở ảnh input 
![[Pasted image 20261009210042.png]]
> [!NOTE] Notes
> Lí do mà 1 pixel ở layer 2 nhận biết 5x5 thay vì 9x9 là vì phép [[Convolution]] có tính chất chồng lấn các pixel với nhau
