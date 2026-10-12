4 nguyên tắc lập trình an toàn:
- không tin dữ liệu người dùng nhập vào
- đừng sáng chế lại bánh xe (sử dụng lại code)
- không tin các lập trình viên khác
- sử dụng các đối tượng bất biến

# bố cục bộ nhớ:
stack: chứa biến cục bộ, tham số và các thông tin của hàm (như giá trị trả vềd)
heap: ptr\[0] = 100
BSS segment: lưu trữ các biến chưa được khởi tạo giá trị
Data segment: lưu trữ các biến đã được khởi tạo giá trị
Text segment: lưu trữ mã máy của chương trình

# bố cục stack
## esp
trỏ vào vị trí trên cùng của stack
## ebp
trỏ vào vị trí làm mốc trong stack
## eip (rip)
trỏ đến vị trí lệnh tiếp theo mà cpu sẽ thực hiện
## khung stack
chứa các thông tin của hàm như tham số, địa chỉ trả về, biến cục bộ
## con trỏ
trỏ vào khung stack trước đó
# tràn bộ nhớ đệm (buffer overflow)
## stack overflow
### stack smash: ghi đè eip
### stack off-by-one: ghi đè ebp


## Các bước khai thác stack overflow
### phát hiện
### xây dựng payload
### bơm payload
### kích hoạt 
### thực thi

## heap overflow


# chống buffer overflow
- ASLR: ngẫu nhiên địa chỉ bộ nhớ mỗi lần chạy
- Stack guard 
- non-excutable stack
- safer function
- safe language 
