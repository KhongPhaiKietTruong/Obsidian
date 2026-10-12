mặc định dùng để xóa các kí tự khoảng trắng và tab (\t) và kí hiệu xuống dòng (\n) ở **hai bên** của chuỗi

mặc định
```python
text = "   Xin chào   \n"
ket_qua = text.strip()

print(f"'{ket_qua}'")
# Kết quả: 'Xin chào'
```

truyền tham số:
```python
text = "...///Xin chào///..."
ket_qua = text.strip("./") 
# xóa tất cả dấu chấm (.) HOẶC dấu gạch chéo (/) ở hai đầu

print(ket_qua) #xin chào
```