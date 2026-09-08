là một cách để bối cảnh / tài nguyên
định nghĩa những hành động sẽ làm khi đi vào trong with và khi đi ra with 
```python
with <context_manager> as <alias_name>:
​	#do something
​	...
​	# clean up resource
```

"clean up" ở đây sẽ là hành động tùy thuộc vào loại resource

ví dụ :
```python
with torch.inference_mode():
​	# some code

```
thì hành động khi đi vào with là 

