cách này không khuyến khích dùng mà thay vào đó nên dùng hoặc 
```python
for x in df['age']:
	print(x)
```

```python
for i in df.index:
	df.loc[i, 'age'] = 18 
```