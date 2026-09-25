viết tắt của location

là một [[Attribute]] của [[DataFrame]], có thể dùng để truy xuất dữ liệu dựa trên **nhãn chữ**

```python
print(df.loc[0]) #in ra hàng đầu tiên của df

print(df.loc[1, 'name']) #in ra giá trị của cột name ở hàng 1 của df

print(df.loc[df['age'] > 18])
```

> [!note]
> nhãn chữ của hàng vẫn là số (xem thêm ở [[Index Labels]])


