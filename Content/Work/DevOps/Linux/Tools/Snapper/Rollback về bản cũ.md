
cách dùng:
trong menu khi khởi động, chọn bản snapshot muốn khôi phục
nhập:
```
sudo limine-snapper-restore
```
sau đó reboot lại máy 

hoặc 
```
snapper list
```
để hiển thị các snapshot sau đó dùng 
```
sudo snapper -c root rollback [ID]
```

lưu ý: chỉ có các file của system được quay về quá khứ còn /home vì vẫn là trạng thái hiện tại