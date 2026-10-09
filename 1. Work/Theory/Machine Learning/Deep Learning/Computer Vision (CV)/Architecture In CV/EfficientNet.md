## Định Nghĩa 
Effiecient Net là model ra đời khi tìm câu trả lời cho câu hỏi: "Làm sao để mở rộng quy mô mạng để tăng độ chính xác mà vẫn tối ưu tài nguyên tính toán"
Loại kiến trúc này giúp chúng ta có thể kiểm soát độ lớn/nhỏ của model bằng cách điều điều chỉnh các tham số như độ sâu, độ rộng, độ phân giải của model bằng một siêu tham số duy nhất 

## Nhược Điểm 
- train chậm hơn so với [[ResNet]] mặc dù số lượng tham số bé hơn nhiều 
## Công Dụng 
- thường dùng làm [[Backbone]] trong dạng bài phân loại và phân vùng 
- tăng độ chính xác mà không làm tăng chi phí tính toán quá nhiều 