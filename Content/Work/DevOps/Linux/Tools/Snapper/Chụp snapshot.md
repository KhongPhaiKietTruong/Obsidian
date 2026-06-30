dùng lệnh này để chụp một bản snapshot mà sẽ không bị xóa 
```bash
sudo snapper -c root create -c "" -d "Truoc khi upgrade he thong"
```

nếu muốn chụp một bản bình thường (sẽ bị xóa khi số lượng bản snapshot đạt giới hạn):
```bash
sudo snapper -c root create -c "number" -d "Mo ta snapshot binh thuong"
```
