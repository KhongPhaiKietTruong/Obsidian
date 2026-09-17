khi thực hiện detection, mỗi một object sẽ có thể có nhiều bounding box được dự đoán
non-max là một thuật toán giúp ta chọn ra được cái bounding box cuối cùng 

các bước của thuật toán này là
B1: chọn ra bounding box có $p_{c}$ lớn nhất ($p_{c}$ là xác xuất của object cần detect có trong ô) 
B2: xóa tất cả những bounding box có [[IoU - Intersection over Union]] > threshold (0.5 hoặc 0.6) so với cái mà ta tìm được ơ B1
B3: nếu vẫn còn bounding box chưa được xác định là kết quả cuối cùng thì quay bước 1 tiếp 

> trong bài toán detect n vật thể thì sẽ thực hiện thực toán này n lần với mục tiêu của mỗi lần là bounding box của vật thể đó 
