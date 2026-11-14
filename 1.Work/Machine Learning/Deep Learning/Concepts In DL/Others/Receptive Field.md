## Định Nghĩa 
Receptive Field là một khái niệm dùng để ước lượng mức độ nhận biết ngữ cảnh của 1 pixel trong các [[Hidden Layer]] lên các pixel của input 
$$RF_l = RF_{l-1} + (k_l - 1) \cdot J_{l-1}$$
**ví dụ**: ta cho một ảnh vào một [[Neural Network]] gồm 2 layer
- layer 1 dùng 3x3 [[Filter]] cho ra [[Feature Map]] F1: 1 pixel ở F "nhìn thấy" được 9 pixels (3x3) ở ảnh input 
- layer 2 cũng dùng 3x3 filter cho ra F2: lúc này, mỗi pixel ở F2 nhận biết được 25 pixels (5x5) ở ảnh input 
![[Pasted image 20261009210042.png]]
> [!NOTE] Notes
> Lí do mà 1 pixel ở layer 2 nhận biết 5x5 thay vì 9x9 là vì phép [[Convolution]] có tính chất trùng lập các pixel với nhau
