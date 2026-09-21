access control (kiểm soát truy cập) có vai trò tương tự với phần authen trong AAA

# các loại kiểm soát truy cập
- ngang
- dọc
- dựa vào ngữ cảnh

# 4 lớp bảo vệ an ninh logic:
- truy cập mạng (VPN - virtual private network)
- truy cập máy tính (MAC)
- truy cập cơ sở dữ liệu (RBAC)
- truy cập ứng dụng (RBAC)

# các yếu tố trong kiểm soát truy cập
- chủ thể (subject - U)
- đối tượng (object - O)
- định danh (principal )
- quyền truy cập (access right)

ACL (access control list - lấy cột từ ma trận kiểm soát truy cập (tập trung vào quyền của các file))
C-list (capability list - lấy hàng (tập trung vào các quyền của các người dùng))

# DAC (discretionary access control) - kiểm soát quyền truy cập tùy quyền:
chủ sở hữu toàn quyền quyết định cách tài nguyên đó được chia sẻ
hạn chế: người được chia sẻ có thể chia sẻ cho người thứ 3 mà chủ sở hữu không biết

# MAC (mandator access control) - kiểm soát truy cập bắt buộc
hệ thống máy tính sẽ quyết định quyền truy cập dự trên chính sách chung của toàn bộ hệ thống 
chia thành nhiều level, tùy vào cấp bậc mà người nào có thể truy cập tới level nào còn gọi là multilevel security (MLS)

có 5 level (từ thấp đến cao): unclassified (U) -> restricted -> confidential (C)-> secret (S)-> top secret (TS)

so sánh
![[Pasted image 20260709003827.png]]
# RBAC (role-based access control) - kiểm soát truy cập dựa trên vai trò
# ABAS (attribute-based access control)