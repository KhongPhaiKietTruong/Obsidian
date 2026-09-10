```python
train_loader = DataLoader(
​	<Dataset_Object>,
​	batch_size = <kích_thước_batch>,
​	shuffle = <Boolean>,
​	pin_memory = False 
)

for epoch in range(epochs):
​	for X_batch, y_batch in train_loader:
​	​	...
```

với dataset_object là một [[Object (Đối tượng)]] được khởi tạo bằng các lớp con của [[torch.utils.data.Dataset]] hoặc tự khởi tạo một custom Dataset object bằng cách tạo một [[Class (Lớp)]] kế thừa từ torch.utils.data.Dataset 

DataLoader là một [[Iterable]] mà sẽ trả về 2 [[Tensor]] mỗi lần duyệt qua, chính là X_batch và y_batch 


