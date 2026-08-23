tạo ra một biến mới chứa các giá trị giống biến cũ (thật chất là chứa các con trỏ trỏ đến cùng địa chỉ của các biến mà trong biến cũ cũng trỏ đến), khi ta thay đổi một biến ([[immutable]]) trong biến mới thì biến cũ sẽ không bị ảnh hưởng bởi vì thật sự ta chỉ đang thay đổi con trỏ của nó sang một ô nhớ mới chứ không thay đổi giá trị của ô nhớ biến đó đang trỏ đến 

```python
l = [1, [2, 3]]
l1 = l.copy()
# l1[0] sẽ trỏ đến một ô nhớ mới mang giá trị là 99 chứ không thay đổi giá trị ô nhớ hiện tại của nó thành 99, đó là lí do l[0] không bị thay đổi bởi vì giá trị tại ô nhớ của l[0] không bị thay đổi
l1[0] = 99
print(l)

l = [1, 2, 3]
l1 = l.copy()
l1[0] = 99
print(l)
```

lưu ý: khi thay đổi một iterable bên trong thì nó vẫn thay đổi lên bản gốc
```python
l = [1, [2, 3]]
l1 = l.copy()
l1[1][0] = 99
print(l)
```

```python
a = [1, 2, 3]
b = a
b[0] = 99
print(b)
```