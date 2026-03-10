
```python
with open(file_path, 'r', encoding='utf-8') as f:
	# doc toan bo mot lan
	res = f.read()
	print(res)
	
	# doc tung dong
	for line in f:
		print(line)
```

lưu ý: khi đọc file theo kiểu từng dòng (for line in f), line sẽ có chứa '\n' trong đó luôn, nên ngta thường dùng thêm [[strip()]] 