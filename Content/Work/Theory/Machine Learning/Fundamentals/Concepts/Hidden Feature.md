dịch: đặc trưng ẩn
## Định Nghĩa
đặc trưng ẩn là [[Features]] mà [[Neural Network]] học được bằng cách kết hợp nhiều đặc trưng lại với nhau, mỗi đặc trưng ẩn chính là mỗi [[Neuron]] nằm trong [[Hidden Layer]] 

## Ví Dụ
ví dụ như ta đang thực hiện bài toán dự đoán xem mặt hàng này có bán được hay không dựa vào các features là 
<center>(A=marketing, B=giá, C=chi phí vận chuyển, D=vật liệu)</center>
ta có thể đoán được một trong các đặc trưng ẩn sẽ là "khả năng mua được của khách hàng" được tạo nên bởi 2 đặc trưng là (B, C), khi trải qua nhiều lần [[Epoch]] huấn luyện, trọng số của hai feature A và D nằm trong neural thể hiện cho đặc trưng ẩn "khả năng mua của khách hàng" sẽ giảm dần (mạng neural học) do hai đặc trưng này không có đóng góp gì để tạo nên đặc trưng ẩn hiện tại nên hai feature này không có đóng góp nhiều tới mức mà giá trị của [[Activation Function]] của hai nerual thể hiện hai đặc trưng đó đó có giá trị nhỏ dần đều và gần như tắt