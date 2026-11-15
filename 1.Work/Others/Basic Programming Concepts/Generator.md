Generator là một cơ chế cho phép tạo ra từng giá trị lần lượt theo yêu cầu thay thì tạo tất cả giá trị cùng một lúc để lưu trên RAM 
khi mà mỗi lần gọi next() trên generator thì nó chạy đến [[yield]] tiếp theo 

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