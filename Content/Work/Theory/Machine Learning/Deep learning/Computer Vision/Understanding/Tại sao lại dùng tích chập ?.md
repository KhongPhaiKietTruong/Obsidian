bởi vì [[Fully Connected Layer]] phải thực hiện tính toán rất nhiều
 
 ## Parameter sharing 
 giả sử trong một bức ảnh 1204x1204, ta không cần phải có đúng 1204x1204 [[Weight (Trọng Số)]] mà chỉ cần $f\times f$ (f là kích thước [[Filter]]) tham số và dùng chung nó cho các vùng trên ảnh 
 > cùng một filter chứa trọng số được dùng trên nhiều trọng số 

## Sparsity of connection 
nếu dùng FC, mỗi [[Neural]] sẽ phải liên kết với tất cả neural của lớp trước đó, trong khi với tích chập thì nó chỉ nhìn vào một fxf neural mà thôi 
 > mỗi neural chỉ nhìn vào một phần nhỏ của input 