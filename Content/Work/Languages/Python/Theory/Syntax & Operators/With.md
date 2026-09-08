là một cách để quản lí tài nguyên, tự động giải phóng tải nguyên sau khi hoàn thành đoạn code nằm trong with dù cho có lỗi xảy ra giữa chừng 
```python
with <resource> as <alias_name>:
​	#do something
​	...
​	# clean up resource
```
"clean up" ở đây sẽ là hành động tùy thuộc vào loại resource
ví dụ với resource là file thì hành động clean up sẽ là file.close()
nếu resource là model.inference() thì clean up là bật lại gradient descent của model 

