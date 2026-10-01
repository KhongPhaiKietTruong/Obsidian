## Định Nghĩa
là một mô hình dùng để ánh xạ một chuỗi đầu vào thành một chuỗi đầu ra mà không nhất thiết độ dài hai chuỗi phải bằng nhau 
gồm hai thành phần chính: [[Encoder]] và [[Decoder]] 

## Hạn Chế 
tất cả các [[Activations In RNN (Hidden State)|Hidden State]] bị nén thành một [[Vector]] duy nhất khiến model bị nghẽn, khi câu dài thì độ chính xác của model giảm xuống, điểm nghẽn này được giải quyết bằng cơ chế [[Attention]] 