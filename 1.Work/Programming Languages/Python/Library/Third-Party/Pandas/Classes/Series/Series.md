## Định Nghĩa 
Series là một [[1.Work/OOP/Theory/Object|Object]] trong pandas tương tự như [[Dictionary]] gồm các key và value (tương ứng với [[1.Work/Programming Languages/Python/Library/Third-Party/Pandas/Classes/DataFrame/Attributes/index|index]] và value), nếu [[DataFrame]] là một cái bảng thì Series là một cột hoặc hàng trong bảng đó

## Tại Sao Không Dùng List 
thế thì tại sao người ta tạo ra object này ? sao không dùng list luôn
đó là vì khi làm việc với dữ liệu, list không có những tính chất có thể đáp ứng được nhu cầu đó của chúng ta
ví dụ:
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

Lưu ý: Cả hàng và cột của df khi được trích xuất thì mỗi cái đều là một Series. Điểm khác biệt là:
* **Nếu trích xuất một cột** (ví dụ: df['ten_cot']): Series nhận được sẽ có index chính là chỉ số dòng (row index) của DataFrame ban đầu.
* **Nếu trích xuất một hàng** (ví dụ: df.loc[chiso_hang]): Series nhận được sẽ lấy tên các cột (columns) của DataFrame ban đầu làm index của nó.
## Lấy Ra Series Từ Df 
có hai cách để lấy một Series từ df:
- df['x']
- df.x
cách thứ nhất được khuyên dùng hơn vì nó có thể xử lí được khi tên cột có khoảng trắng (df['ten va ho'])  