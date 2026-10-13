footprinting (thu thập thông tin thụ động)
scanning network (dò quét mạng chủ động):
- port scanning: quét cổng
- network scanning: quét mạng 
- vulnerability scanning: quét lỗ hỏng


# các loại tường lửa

## packet filtering firewall
chỉ kiểm tra thông tin trong header
## stateful inspection firewall 
theo dõi TCP
## circuit-level gateway 
ngắt kết nối TCP gốc và thiết lập 2 TCP riêng biệt
## proxy firewall
ngắt kết nối và đóng vai trò là thực thể trung chuyển lưu lượng ở tầng ứng dụng 


# các mô hình phòng thủ 
## bastion host (máy chủ pháo đài)
## host-based firewall (tường lửa trên từng máy chủ)
## personal firewall (tường lửa cá nhân)


# các loại DOS
## spoofing
- source address
- SYN 
## flooding
- ICMP
- UDP
- TCP SYN Flood

# IDS (hệ thống phát hiện xâm nhập) (intrusion detection system)
gồm 5 thành phần:
- cảm biến
- bộ phân tích
- cơ sở tri thức
- thiết bị cấu hình
- bộ phản hồi

# phân loại IDS
## phân loại theo chiến lược phân tích
- **signature-based IDS**: so sánh dữ liệu thu được với các chữ kĩ của các cuộc tấn công trước
- **anomaly IDS**: liên tục quan sát phân tích hành vi bất thường
## phân loại theo nguồn thông tin
- Host-based IDS (HIDS): là phần mềm được cài trên từng máy chủ để giám sát
- Network-based IDS: giám sát lưu lượng mạng, sử dụng 2 cảm biến là cảm biến trực tiếp (inline) và cảm biến thụ động (passive)
# IPS (intrusion prevention system)
chạy trực tiếp (inline)
khi phát hiện tấn công, IPS hoạt động ở drop mode với 3 lựa chọn xử lí:
- drop: bỏ gói tin độc ại, gửi một gói TCP về máy để reset
- sdrop: âm thầm hủy bỏ gói tin
- ignore: bỏ gói tin độc hại, gửi TCP về máy để reset nhưng không lưu log

![[Pasted image 20260709104042.png]]