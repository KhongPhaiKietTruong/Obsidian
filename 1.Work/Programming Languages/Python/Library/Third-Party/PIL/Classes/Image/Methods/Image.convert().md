convert() dùng để chuyển đổi ảnh sang [[Image.mode]] khác của một [[PIL.Image]] 
```python
img = Image.open(path).convert('RGB')
```

thường dùng để đảm bảo rằng ảnh truyền vào model sẽ là ảnh RGB 
các [[Argument]] có thể truyền:
- RGB
- BGR 
- L: ảnh xám 