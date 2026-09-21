```python
train_loader = DataLoader(
​	<Dataset_Object>,
​	batch_size = <kích_thước_batch>,
​	shuffle = False,
​	pin_memory = False 
)

for epoch in range(epochs):
​	for X_batch, y_batch in train_loader:
​	​	...
```
với các tham số:
- với dataset_object là một [[Object (Đối tượng)]] được khởi tạo bằng các lớp con của [[torch.utils.data.Dataset]] (như TensorDataset) hoặc tự khởi tạo một custom Dataset object bằng cách tạo một [[Class (Lớp)]] kế thừa từ torch.utils.data.Dataset  
- shuffle: xáo trộn các mẫu trước khi tạo các batch 
- pin_memory: bật tham số này giúp việc đem Tensor/Model qua GPU nhanh hơn, giúp việc training nhanh (xem thêm ở [[huẩn luyện model trên gpu]])

DataLoader là một [[Iterable]] mà sẽ trả về 2 [[Tensor]] mỗi lần duyệt qua, chính là X_batch và y_batch 


