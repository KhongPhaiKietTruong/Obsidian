là một cách để quản lí tài nguyên, tự động giải phóng tải nguyên sau khi hoàn thành đoạn code nằm trong with dù cho có lỗi xảy ra giữa chừng 
```python
with <resource> as <alias_name>:
​	#do something
​	...
​	# clean up resource
```
