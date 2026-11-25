## Định Nghĩa 
optimizer.zero_grad() dùng để reset lại giá trị của [[Gradient]] của các tham số trong model về lại bằng 0 hoặc None (tuỳ vào tham số set_to_none), ta phải thực hiện thao tác này mỗi khi muốn tính gradient thì pytorch có cơ chế cộng dồn gradient 
cú pháp:
```python
optimizer.zero_grad(set_to_none=False)
```
với:
- set_to_none: quyết định xem reset giá trị gradient về 0 hay None (về None sẽ tiết kiệm tài nguyên tính toán hơn), nếu không có can thiệp gì quá sâu thì đặt tham số này bằng True thường không gây lỗi gì nhiều 