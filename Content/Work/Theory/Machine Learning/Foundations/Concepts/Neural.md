là một đơn vị nằm trong các [[layer]] nằm trong [[Neural Network (Mạng Neural)]], nói cách khác là một layer sẽ chứa nhiều neural và mạng neural sẽ chứa nhiều layer 

bên trong neural là một hàm số [[Sigmoid]] ([[Activation Function (Hàm Kích Hoạt)]]) nhận vào tham số là z với z là [[Linear equation|phương trình tuyến tính]] có dạng:
$$
z_j^{[l]} = \sum_k w_{jk}^{[l]} a_k^{[l-1]} + b_j^{[l]}
$$
với:
- l là số của layer hiện tại 
- k là số neural của lớp trước 
- j là số neural lớp hiện tại 
giả sử lớp trước của ta có 3 [[Neural]] thì công thức này triển khai thành
$$
z_j^{[l]} = w_{j1}^{[l]}a_1^{[l-1]} + w_{j2}^{[l]}a_2^{[l-1]} + w_{j3}^{[l]}a_3^{[l-1]} + b_j^{[l]}
$$
lí do mà w(j, k) là vì W là một ma trận, truy cập một phần tử trong W sẽ là w(j, k) (xem thêm trong [[Biểu diễn ma trận trọng số W]])  

trong mạng neural, ta còn có thể nói mỗi neural chính là [[Features (Đặc Trưng)]] ẩn được suy ra bằng việc ghép hợp nhiều đặc trưng ở lớp trước lại 
