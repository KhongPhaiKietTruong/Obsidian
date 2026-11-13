dịch: tăng cường dữ liệu
## Định Nghĩa 
Tăng cường dữ liệu là thao tác tạo ra các biến thể mới dựa trên dữ liệu gốc bằng các thao tác biến đổi 

## Công Dụng 
- giảm [[Overfitting - High Variance]] 
- giải quyết vấn đề [[Training Set]] có ít mẫu 
- tăng tính [[Generalization]] 

## Nguyên Tắc Thực Hiện 
- thao tác tăng cường không được làm cho mẫu mất đi ý nghĩa của nó (ta không thể cắt hết con mèo ra khỏi một tấm ảnh mèo trong bài toán phân loại mèo)
- khi thực hiện tăng cường dữ liệu trong bài toán [[Object Detection]] hoặc [[Image Segmentation]] thì nhãn của nó cũng phải biến đổi theo tương ứng 

## Các Loại Tăng Cường Dữ Liệu 
### Realistic Augmentation 
Là dạng tăng cường mô phỏng các điều kiện thực tế trên môi trường triển khai mà model sẽ hoạt động 
>ví dụ như khi xây dựng model detect xe trên đường thì ta sẽ thực hiện các thao tác biến đổi để mô phỏng các trường hợp như mưa, xe bị che một phần, trời nắng gắt, ... 
### Regularization-Oriented Augmentation 
Là dạng tăng cường nhằm tăng tính đa dạng cho dữ liệu, giảm overfitting và tăng generalization 

## Cách Chọn Pipeline Tăng Cường 
Đầu tiên, ta xem xét trên góc độ môi trường triển khai thực tế để chọn các thao tác tăng cường trước, rồi mới chọn thêm các thao tác thuộc nhóm regularization để tăng tính generalization 