tạo ra một đối tượng mới chứa các giá trị giống đối tượng cũ (thật chất là chứa các con trỏ trỏ đến cùng địa chỉ của các đối tượng mà trong đối tượng cũ cũng trỏ đến), khi ta thay đổi một đối tượng ([[Immutable (bất biến)]]) trong đối tượng mới thì đối tượng cũ sẽ không bị ảnh hưởng bởi vì thật sự ta chỉ đang thay đổi con trỏ của nó sang một ô nhớ mới chứ không thay đổi giá trị của ô nhớ đối tượng đó đang trỏ đến 

```python
l = [1, [2, 3]]
l1 = l.copy()
# l1[0] sẽ trỏ đến một ô nhớ mới mang giá trị là 99 chứ không thay đổi giá trị ô nhớ hiện tại của nó thành 99, đó là lí do l[0] không bị thay đổi bởi vì giá trị tại ô nhớ của l[0] không bị thay đổi
l1[0] = 99
print(l)
```

lưu ý: khi thay đổi một đối tượng mutable bên trong (trong trường hợp dưới chính là một list - một mutable) thì nó vẫn thay đổi lên bản gốc bởi vì nó thật sự thay đổi giá trị tại ô nhớ đó chứ không tạo thêm ô nhớ mới 
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