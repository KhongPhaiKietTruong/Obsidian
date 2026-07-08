# yêu cầu TCB (trusted computing base): 
- complete mediation: giám sát toàn diện
- tamperproof: kháng thay đổi
- verifiable: có thể kiểm chứng
# nguyên tắc thiết kế TCB
- đặc quyền tối thiểu
- tính tối giản (code ít và dễ phân tích)
- thiết kế mở
- kiểm soát toàn diện
- mặc định từ chối
- dễ sử dụng
# các thành phần trong môi trường bảo mật hệ điều hành
gồm có 3 lớp:
- lớp tập tin
- lớp bộ nhớ: được chia thành 2 phần là kernel space và user space, sử dụng cách kĩ thuật như phân đoạn và phân trang
- lớp dịch vụ

# unix file permission
![[Pasted image 20260708222252.png]]

# tấn công leo thang đặc quyền
leo thang đặc quyền ngang : chiếm quyền hạn của một user khác
leo thang đặc quyền dọc: chiếm quyền hạn của admin/root
# ảo hóa 
Hosted virtualization: chạy trên một hđh có sẵn nên thừa hưởng toàn bộ lỗ hỏng bảo mật của hđh đó
bare-metal virtualization: chạy trực tiếp trên phần cứng vật lí

# vòng đặc quyền 
có 4 vòng đếm số từ 0 đến 3:
- ring 0: kernel
- ring 1: device driver
- ring 2: os services
- ring 3: applications
# chuyển file
FTP: file transfer protocol
SFTP: secure file transfer protocol 
P2P: peer to peer

điểm yếu của FTP là truyền cả username và passwords dưới dạng văn bản rõ lên mạng
tài khoản root không thể dùng FTP

# biện pháp  bảo vệ khi truyền file
- dùng SFTP
- phân quyền thư mục: thiết lập hai thư mục FTP riêng biệt:
​	​	- một để tải lên và chỉ có quyền ghi
​	​	- một để tải xuống và chỉ có quyền đọc