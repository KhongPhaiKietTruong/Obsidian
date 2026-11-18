## Định Nghĩa 
Combined Loss Function là [[Loss Function]] được kết hợp có trọng số từ nhiều loss function khác nhau để tận dụng ưu điểm của từng loại 

## Công Dụng 
thường được sử dụng trong dạng bài [[Image Segmentation]], [[Object Detection]] , ... 
ví dụ: trong bài toán Segmentation, ta có thể dùng [[Cross-Entropy Loss]] (không hiệu quả khi class bị mất cân bằng) kết hợp với [[Dice Loss]] (tập trung vào độ bao phủ lên từng lớp) 
