dịch: đặc trưng ẩn
## Định Nghĩa
đặc trưng ẩn là [[Features]] mà [[Neural Network]] học được bằng cách kết hợp nhiều đặc trưng lại với nhau, mỗi đặc trưng ẩn chính 

## Ví Dụ
ví dụ như ta đang thực hiện bài toán dự đoán xem mặt hàng này có bán được hay không dựa vào các features là 
<center>(A=marketing, B=giá, C=chi phí vận chuyển, D=vật liệu)</center>
ta có thể đoán được một trong các đặc trưng ẩn sẽ là "khả năng mua được của khách hàng" được tạo nên bởi 2 đặc trưng là (B, C) và sẽ có những [[Neural]] thể hiện đặc trưng này, khi trải qua nhiều lần [[Epoch]] huấn luyện, trọng số của hai feature ("marketing", "vật liệu") sẽ giảm dần (đang xét ở neural thể hiện đặc trưng ẩn là "khả năng mua được của khách hàng" nên hai feature này không có đóng góp nhiều) tới một mức độ mà output của nerual đó có giá trị nhỏ dần đều và gần như tắt