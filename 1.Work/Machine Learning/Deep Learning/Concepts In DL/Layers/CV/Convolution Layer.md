là loại [[Layer]] dùng để lấy ra những [[Hidden Feature]] trong ảnh bằng cách sử dựng những [[Filter]]
mỗi lớp convolution có thể chứa nhiều filter 

ta thường sẽ tắt [[Bias]] trong lớp tích chập nếu ngay sau lớp tích chập là [[Batch Norm Layer]] do batch norm layer đã có bias của riêng nó rồi và nếu có bật bias ở lớp tích chập thì nó cũng sẽ bị triệt tiêu sau khi đi qua batch norm nên việc bật nó chỉ khiến tốn chi phí tính toán hơn thôi 