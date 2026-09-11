là những "cổng kết nối" mà thiết bị dùng để kết nối tới mạng
một interface có thể có một hoặc nhiều địa chỉ ip riêng 

ví dụ:
Laptop
├── wlan0   → Wi-Fi network
├── eth0    → Ethernet network
├── docker0 → Docker virtual network
└── lo      → loopback network

đây là 4 interfaces 

có thể xem các interfaces của máy bằng lệnh [[ip link - ip addr]] 