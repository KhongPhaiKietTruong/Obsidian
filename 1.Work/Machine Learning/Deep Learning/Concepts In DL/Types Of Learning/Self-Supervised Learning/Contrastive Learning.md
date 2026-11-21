dịch: học tương phản 

## Định Nghĩa 
Học tương phản là một phương pháp học thuộc mô hình [[Metric Learning]] dựa trên các mẫu là các cặp thuộc một trong hai loại:
- positive pairs: các cặp có hai mẫu tương tự nhau
- negative pairs: các cặp có hai mẫu khác nhau
nhằm đưa các mẫu tương tự nhau về gần nhau và các mẫu khác nhau ra xa nhau trong [[Vector Space]] 

## Kiến Trúc
Các kiến trúc phổ biến theo phương pháp này:
- [[Siamese Network]]
- [[Triplet Network]] 
- [[SimCLR]]

## Ứng Dụng 
- Image Retrievial 
- Face Recognition 
- Visual Place Recognition 
- Image Matching 
- [[Multimodal Learning]] 
- [[Anomoly Detection]] 

> [!NOTE]
> ta hoàn toàn có thể dùng dataset không có nhãn để tạo ra các cặp bằng việc tạo cặp positive bằng một ảnh gốc và một ảnh là biến thể của ảnh gốc đó thông qua quá trình tăng cường 

