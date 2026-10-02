dịch: vùng cảm nhận 

## Định Nghĩa 
Vùng cảm nhận là một khái niệm dùng để ước lượng mức độ nhận biết ngữ cảnh của 1 pixel trong các [[Hidden Layer]] lên các pixel của input 

**ví dụ**: ta cho vào một ảnh
ở layer 1 dùng 3x3 [[Filter]]: 1 pixel ở [[Feature Map F]] nhận biết được 9 pixels (3x3) ở ảnh input 
layer 2 cũng dùng 3x3 filter: lúc này, mỗi pixel ở layer 2 nhận biết được 25 pixels (5x5) ở ảnh input 

> [!NOTE] Notes
> Lí do mà 1 pixel ở layer 2 nhận biết 5x5 thay vì 9x9 là vì phép [[Convolution]] có tính chất trùng lập các pixel với nhau
