
cách dùng:
trong menu khi khởi động, chọn bản snapshot muốn khôi phục, khi boot vào rồi mà muốn rollback thì vào terminal nhập:
```bash
sudo limine-snapper-restore
```
sau đó reboot lại máy 

hoặc 
```bash
snapper list
```
để hiển thị các snapshot sau đó dùng 
```bash
sudo snapper -c root rollback [ID]
```

lưu ý: chỉ có các file của system được quay về quá khứ còn /home vì vẫn là trạng thái hiện tại