![[Pasted image 20260921004751.png]]
## Định Nghĩa
là một [[Neural Network]] dùng để xử lí dữ liệu dạng chuỗi sử dụng cơ chế [[Attention]] gồm 2 thành phần chính là [[Encoder]] và [[Decoder]]

mỗi một token có thể nhìn tới các token khác trong cùng một chuỗi 
transformer có thể tính toán song song ([[Multi-Head Attention]])
## Đặc Điểm 
- trước khi được đưa vào encoder, các token được thêm thông tin về vị trí (positional encoding) 
- 