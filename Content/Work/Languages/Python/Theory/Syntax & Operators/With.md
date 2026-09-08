là một cách để bối cảnh / tài nguyên
định nghĩa những hành động sẽ làm khi đi vào trong with và khi đi ra with 
```python
with <context_manager> as <alias_name>:
​	#do something
​	...
​	# clean up resource / restore state 
```

"clean up" ở đây sẽ là hành động tùy thuộc vào loại resource

ví dụ :
```python
with torch.inference_mode():
​	# some code

```

thì hành động khi đi vào with là tắt những cơ chế có liên quan đến [[Gradient]] (vì ta đang thực hiện dự đoán chứ không phải training) và hành động đi ra là khôi phục lại những cơ chế mà ta đã tắt ở hành động đầu về trạng thái cũ 

giải thích kĩ hơn, khi tạo một context manager với một [[Object (Đối tượng)]], object đó sẽ có hai [[Special method - Magic method - Dunder method]] là enter() và exit(), trong hai hàm đó sẽ định nghĩa những dòng lệnh mà ta sẽ thực hiện khi vào with và ra with 
