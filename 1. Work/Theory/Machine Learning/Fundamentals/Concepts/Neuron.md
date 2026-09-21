tên khác: perceptron, node

## Định Nghĩa
là một đơn vị nằm trong các [[Layer]] nằm trong [[Neural Network]], nói cách khác là một layer sẽ chứa nhiều neural và mạng neural sẽ chứa nhiều layer 

bên trong neural là một [[Activation Function]] nhận vào tham số là z với z là [[Linear equation|phương trình tuyến tính]] có dạng:
$$
z_j^{[l]} = \sum_k w_{jk}^{[l]} a_k^{[l-1]} + b_j^{[l]}
$$
với:
- l là số của layer hiện tại 
- k là số neural của lớp trước 
- j là số neural lớp hiện tại 

## Ví Dụ 
giả sử lớp trước của ta có 3 [[Neuron]] thì công thức này triển khai thành
$$
z_j^{[l]} = w_{j1}^{[l]}a_1^{[l-1]} + w_{j2}^{[l]}a_2^{[l-1]} + w_{j3}^{[l]}a_3^{[l-1]} + b_j^{[l]}
$$
W là một ma trận, truy cập một phần tử trong W sẽ là $w_{jk}$ (xem thêm trong [[Biểu diễn ma trận trọng số W]])  

trong mạng neural, ta còn có thể nói mỗi neural chính là [[Features]] ẩn được suy ra bằng việc ghép hợp nhiều đặc trưng ở lớp trước lại 
