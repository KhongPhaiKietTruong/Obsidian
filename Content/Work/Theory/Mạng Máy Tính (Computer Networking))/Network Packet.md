khi truyền dữ liệu, ta không truyền tất cả một lượt mà ta sẽ chia nhỏ nó ra thành những network packet

mỗi network packet gồm hai thành phần chính là:
- header: chứa các thông tin phục vụ cho việc vận chuyển gói tin đó (ip đích, ip nguồn, ...)
- loader: dữ liệu cần được gửi 