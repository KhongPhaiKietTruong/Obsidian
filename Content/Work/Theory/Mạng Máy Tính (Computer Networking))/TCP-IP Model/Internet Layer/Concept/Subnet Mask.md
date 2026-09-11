gắn liền với [[IPv4]], dùng để chỉ định xem phần nào là network part, phần nào là host part

ví dụ với IPv4:
```
IP:          192.168.1.25
Subnet mask: 255.255.255.0
```

thì subnet mask của nó chỉ ra rằng 24 bits đầu là network part

cũng có thể viết ngắn gọn bằng cách gộp hai cái lại thành:
192.168.1.25/24 (với 24 là chỉ rằng 24 bits đầu là của network part)

network part là địa chỉ để xác định mạng đó 
host part là địa chỉ để xác định thiết bị trong mạng đó 