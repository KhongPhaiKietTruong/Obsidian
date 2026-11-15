Generator là một cơ chế cho phép tạo ra từng giá trị lần lượt theo yêu cầu thay thì tạo tất cả giá trị cùng một lúc và lưu trên RAM có thể gây tràn, khi mà mỗi lần gọi next() trên generator thì nó chạy đến [[yield]] tiếp theo 

lưu ý: ở giữa các yield sẽ có thể có nhiều dòng code 
ví dụ:
```python
def gen():
    x = 10
    x += 5
    yield x
    x *= 2
    yield x
gen = gen()
next(gen) # 15 
next(gen) # 30  
```