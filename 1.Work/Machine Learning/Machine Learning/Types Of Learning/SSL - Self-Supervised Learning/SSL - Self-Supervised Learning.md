dịch: học tự giám sát 

## Định Nghĩa 
SSL là một phương pháp học khi mà model sẽ tự tạo ra bài toán và label tương ứng để train chính nó dựa trên input data chưa được gán nhãn mà ta cung cấp 

ví dụ 1: "I love machine learning" -> "i love ... learning"
model tự tạo ra bài toán là **đoán từ**, nó che từ machine (đồng thời dùng từ này làm label luôn), rồi dùng bài toán này để train 

ví dụ 2: thực hiện **che** một phần nhỏ trên ảnh rồi bắt model phải dự đoán phần ảnh bị che đó đó 
## Công Dụng  
- được dùng để tạo ra một [[Feature Extractor]] có khả năng trích xuất đặc trưng có ích để làm [[Backbone]] cho downstream task 
## Trường Hợp Sử Dụng 
- Khi dữ liệu không có nhãn hoặc chỉ có một phần là có nhãn 
- Khi việc gán nhãn dữ liệu rất tốn kém hoặc khó thực hiện 

## Các loại SSL
các dạng học tự giám sát phổ biến:
- [[Contrastive Learning]]
- [[MIM - Masked Image Modeling]]
- [[Self-Distillation]] 