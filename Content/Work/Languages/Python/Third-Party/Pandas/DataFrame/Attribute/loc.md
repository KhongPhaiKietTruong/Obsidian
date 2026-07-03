loc: viết tắt của location

là một [[Attribute (Thuộc tính)]] của [[DataFrame]] để truy xuất dữ liệu dựa trên **nhãn**
```python
print(df.loc[1]) #in ra series có nhãn 1

print(df.loc[1, 'name']) #in ra một ô dữ liệu cụ thể

print(df.loc[df['age'] > 18])
```