Là một object trong pandas gần như tương tự [[List]] của python, nếu [[DataFrame]] là một cái bảng thì Series là một cột trong bảng đó

một Series sẽ đi kèm với index, nếu ta không chỉ định index cho nó thì mặc định là 0, 1, 2 ...

thế thì tại sao người ta tạo ra object này ? sao không dùng list luôn
đó là vì khi làm việc với dữ liệu, list không có những tính chất có thể đáp ứng được nhu cầu đó của chúng ta, ví dụ :
```python
lst = [1, 2, 3]
lst = lst + 2
print(lst) 
#output: 
# gây lỗi do lst không thể cộng với một số nguyên

ser = pd.Series(lst)
ser = ser + 2
print(ser)
#output:
# [3, 4, 5]
```

lưu tạo: mỗi Series có index riêng của nó, nhưng khi ghép lại trong một bảng, các index của nó giống nhau
