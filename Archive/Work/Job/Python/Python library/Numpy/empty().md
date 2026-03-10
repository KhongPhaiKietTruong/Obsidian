dùng để tạo một mảng có các giá trị rác, thường mảng này chỉ để được ghi đè lên sau khi tính toán gì đó

lí do ta không dùng [[zeros()]] hay [[ones()]] là gì nó sẽ tốn công gán giá trị 0 hoặc 1 gây chậm mà đằng nào cũng xóa, hàm empty giải quyết vấn này một cách nhanh khi không cần gán giá trị mà nó lấy đại giá trị rác của ram

```python
a = np.empty((2, 2)) 
print(a)

#output
#[[ 4.646e-310  1.234e-320]
# [ 0.000e+000  6.953e-310]]
```
