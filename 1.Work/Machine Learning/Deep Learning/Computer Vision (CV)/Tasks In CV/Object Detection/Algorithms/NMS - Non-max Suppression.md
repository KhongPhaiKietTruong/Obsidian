khi thực hiện detection, mỗi một object sẽ có thể có nhiều bounding box được dự đoán,
non-max suppression là một thuật toán giúp ta chọn ra được các bounding box cuối cùng 

các bước của thuật toán này là
B1: chọn ra bounding box có $p_{c}$ lớn nhất ($p_{c}$ là xác xuất của object cần detect có tồn tại trong ô hay không)  
B2: xóa tất cả những bounding box có [[IoU - Intersection over Union]] > threshold (0.5 hoặc 0.6) so với cái mà ta tìm được ở bước 1 
B3: nếu vẫn còn bounding box chưa được xác định là kết quả cuối cùng thì quay bước 1 tiếp 

> [!NOTE] Notes
> trong bài toán detect n nhãn vật thể thì sẽ thực hiện thực toán này n lần với mục tiêu của mỗi lần là bounding box của nhãn vật thể đó 
