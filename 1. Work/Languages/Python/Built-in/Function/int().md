nhận vào hai tham số n và b (thường dùng với 1 tham số n)
n có thể là số thực hoặc chuỗi biểu diễn số nguyên
b là số nguyên thể hiện cho hệ cơ số (nếu có dùng b thì n bắt buộc phải là str)

```python
int(3.99)
int(100)
int("FF", 16)
```

lưu ý: không thể chuyển trực tiếp một str biểu diễn số thập phân sang kiểu nguyên với int() được mà phải chuyển sang kiểu float trước
```python
int(float('2.44'))
```

