khi thực hiện detection, mỗi một object sẽ có thể có nhiều bounding box được dự đoán,
NMA là một thuật toán giúp ta chọn ra được các bounding box cuối cùng 

các bước của thuật toán này là
B1: chọn ra [[Bounding Box]] có confidence cao nhất 
B2: xóa tất cả những bounding box có [[IoU - Intersection over Union]] > threshold (0.5 hoặc 0.6) so với cái mà ta tìm được ở bước 1 
B3: lặp lại cho đến khi không còn bounding box nào chưa được chọn  
![[Pasted image 20261106212557.png]]
> [!NOTE] Notes
> trong bài toán detect n nhãn vật thể thì sẽ thực hiện thực toán này n lần với mục tiêu của mỗi lần là bounding box của nhãn vật thể đó 

