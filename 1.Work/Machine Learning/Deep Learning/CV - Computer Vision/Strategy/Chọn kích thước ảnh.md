kích thước ảnh càng nhỏ thì càng mất nhiều chi tiết ảnh nhưng chi phí tính toán sẽ giảm

các kích thước ảnh phổ biến:
- 128x128
- 256x256
- 512x512

Các yếu tố ảnh hưởng đến việc chọn kích thước ảnh để đưa vào model:
- kích thước ảnh gốc
- tác vụ đang thực hiện: [[1.Work/Machine Learning/Machine Learning/Type Of Tasks In ML/Classification/Classification|Classification]] thì không cần kích thước ảnh quá lớn còn segmentation thì cần (nhất là medical)

các nguyên tắc:
- kích thước ảnh (cả chiều cao lẫn chiều rộng): là bội số của **16** (vd: 256x256)
- nếu kích thước ảnh gốc đã ở dạng chuẩn (chia hết cho 16) và các ảnh trong cùng một batch có kích thước giống nhau thì không resize nữa 