4 nguyên tắc lập trình an toàn:
- không tin dữ liệu người dùng nhập vào
- đừng sáng chế lại bánh xe (sử dụng lại code)
- không tin các lập trình viên khác
- sử dụng các đối tượng bất biến

bố cục bộ nhớ:
stack: chứa biến cục bộ, tham số và các thông tin của hàm (như giá trị trả vềd)
heap:
BSS segment: lưu trữ các biến chưa được khởi tạo giá trị
Data segment: lưu trữ các biến đã được khởi tạo giá trị
Text segment: lưu trữ mã máy của chương trình
# tràn bộ nhớ đệm (buffer overflow)
