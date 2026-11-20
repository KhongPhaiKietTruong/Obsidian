viết tắt của: Region-based Convolution Neural Network 

## Định Nghĩa
R-CNN là một kiến trúc cho tác vụ [[Object Detection]] ra mắt vào 2014

## Cách Hoạt Động 
Bước 1: đề xuất ra các vùng có thể chứa vật thể cần detect bằng thuật toán selective search 
bước 2: trích xuất đặc trưng của từng vùng được đề xuất bằng một backbone
bước 3: phân loại cách vùng đó thành các lớp (chó, mèo, gà, ...) 
bước 4: điều chỉnh lại toạ độ [[Bounding Box]] cho chính xác hơn 
## Nhược Điểm 
- chi phí tính toán rất nhiều, tốc độ inference rất chậm  