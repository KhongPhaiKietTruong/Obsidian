dùng để tạo thư mục ở đường dẫn hiện tại

```python
MODEL_PATH = Path("<đường dẫn>")
MODEL_PATH.mkdir()
```

ví dụ cụ thể:
```python
MODEL_PATH = Path("./test")
MODEL_PATH.mkdir(parents=True, exist_ok = True)
```
cái phần "./" thì class Path đã mặt định luôn rồi nên có thể có hoặc không 

hai tham số thường dùng:
- parents: tự tạo các thư mục cha 
- exist_ok: nếu thư mục đã tồn tại rồi thì không làm gì cả 