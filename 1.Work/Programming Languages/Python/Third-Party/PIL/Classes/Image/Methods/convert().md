convert() dùng để chuyển chế độ (sự sắp xếp các kênh) của một [[PIL.Image]] 
```python
img = Image.open(path).convert('RGB')
```

thường dùng để đảm bảo rằng ảnh truyền vào model sẽ là ảnh RGB 
các [[Argument]] có thể truyền:
- RGB
- BGR 
- L: ảnh xám 