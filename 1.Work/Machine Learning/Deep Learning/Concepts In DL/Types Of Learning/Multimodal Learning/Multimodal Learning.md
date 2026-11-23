dịch: học đa phương thức 
modality: dạng dữ liệu (text, ảnh, ...)
***
## Định nghĩa
Học đa phương thức là một phương pháp học từ nhiều dạng dữ liệu khác nhau (từ cả ảnh, text, ...) để thực hiện một tác vụ cuối nào đó 

## Các Tasks Phổ Biến
- Image Captioning: tạo ra đoạn text mô tả hình ảnh
- Visual Question Anwsering: trả lời câu hỏi dựa trên hình ảnh 
- Cross-Modal Retrievial: sử dụng một modality để tìm một modality khác 
- Multimodal Classification: thực hiện classification dựa trên nhiều modality 
- Multimodal Localization: thực hiện [[Localization]] với mục tiêu được xác định bằng một modality khác 

## Các cách kết hợp dữ liệu 
### Early Fusion
Đưa các dạng dữ liệu qua [[Encoder]] của riêng nó cho ra [[Embeddings]] rồi kết hợp các embeddings của các dạng dữ liệu lại với nhau ![[Pasted image 20261111104515.png|501]]
### Intermediate Fusion 
Kết hợp các embeddings ở tầng trung gian 

### Late Fusion
Kết hợp các prediction 
![[Pasted image 20261111104718.png|491]]

