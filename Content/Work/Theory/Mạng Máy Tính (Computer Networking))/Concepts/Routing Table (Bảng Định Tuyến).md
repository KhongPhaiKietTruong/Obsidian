là cái bảng mà máy tính hoặc [[Router]] sẽ tham khảo khi máy tính muốn gửi [[Network Packet]] đến một địa chỉ IP nào đó 

bảng này sẽ trả lời câu hỏi rằng: "muốn gửi packet tới địa chỉ này thì cần gửi cho route nào" (lưu ý địa chỉ ở đây nói là tất cả địa chỉ bao gồm cả địa chỉ bên ngoài mạng cục bộ)

cấu tạo mỗi dòng của routing table gồm:
- ip muốn gửi đến
- gateway / next-hop: cái địa chỉ mà ta sẽ gửi đến 
- interface: card mạng mà ta sẽ sử dụng 
- metric: độ ưu tiên route

tham khảo thêm ở ([[ip route]])
có thể xem routing table trên terminal bằng lệnh "ip route"