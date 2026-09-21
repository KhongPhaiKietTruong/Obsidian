là một [[Object (Đối tượng)]], cũng là một [[Iterator]] đặc biệt, khi mà mỗi lần gọi next() trên generator thì nó chạy đến yield tiếp theo 

lưu ý: ở giữa các yield sẽ có thể có nhiều dòng code 
ví dụ:
```python
def gen():
    print("Start")

    x = 10
    x += 5
    print("Before first yield")

    yield x

    print("Continue...")
    x *= 2
    print("Before second yield")

    yield x

    print("End")
```