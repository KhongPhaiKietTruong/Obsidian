hàm full cũng khá giống [[zeros()]] với [[ones()]], nhưng thay vì chỉ tạo ra giá trị, 0 và 1 thì nó cho ta tùy chỉnh giá trị mong muốn
```python 
full(<tuple_size>, fill_value)
```
các tham số:
- kích thước mảng
- giá trị muốn điền
```python
a = np.full((2, 3), 9)
#output:
# array([[9, 9, 9],
#        [9, 9, 9]])
```
