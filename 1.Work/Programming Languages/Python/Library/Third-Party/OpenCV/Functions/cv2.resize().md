```python
cv2.resize(src, dsize, *, fx, fy, interpolation) 
```
với: 
- src: ảnh gốc
- dsize: tuple (width, height) kích thước muốn resize thành
- fx: hệ số tỉ lệ chiều rộng
- fy: hệ số tỉ lệ chiều cao
- interpolation: phương pháp nội suy ra pixel ảnh mới
![[Pasted image 20260117204829.png]]

> [!NOTE] notes
> ta có thể không cần chỉ định kích thước cứng cho ảnh mà có thể dùng tỉ lệ, khi đó dsize để là None, và truyền tỉ lệ mong muốn vào fx, fy 
