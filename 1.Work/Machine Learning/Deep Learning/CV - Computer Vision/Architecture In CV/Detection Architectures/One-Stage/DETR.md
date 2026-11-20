viết tắt của Detection Transformer 

## Định Nghĩa 
DETR là một kiến trúc kết giữa CNN và Transformer không sử dụng [[Anchor Box]] 

## Thành Phần Chính 
bao gồm 5 thành phần chính: 
- CNN backbone dùng để trích xuất đặc trưng ảnh 
- Positional Encoding: cộng thêm thông tin về vị trí vào [[Feature Map]] 
- [[Transformer Encoder]]
- [[Transformer Decoder]]
![[Pasted image 20261106220808.png]]
## Công Dụng 
- Dùng trong [[Object Detection]] 