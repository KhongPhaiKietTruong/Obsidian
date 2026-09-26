dùng để tạo pipeline gồm nhiều bước biến đổi ảnh được đọc vào
cú pháp:
```python
transform = transfrom.Compose([
​	<các_bước_biến_đổi>
])
```
thường dùng kèm với [[ImageFolder]] 