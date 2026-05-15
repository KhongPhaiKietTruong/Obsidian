là viết tắt của principal component analysism

là phương pháp dùng để giảm số chiều của dữ liệu nhưng vẫn cố gắng giữ lại tối đa thông tin 

giả sử ta có một tập dữ liệu 5 chiều, ta muốn giảm nó xuống còn n chiều (n<5) thì

1. dựa trên dữ liệu, tìm [[Covariance matrix]] 
2. tìm [[Eigenvalue]] và [[Eigenvector]] của covariance matrix
3. chọn ra n eigenvalue có giá trị cao nhất (để bảo toàn được tối đa thông tin) và các eigenvector tương ứng
4. chiếp tập dữ liệu lên n eigenvector đó (lấy ma trận dữ liệu nhân cho ma trận gồm các vector riêng được chuẩn hóa)