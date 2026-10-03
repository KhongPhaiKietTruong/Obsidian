DataLoader là một [[1. Work/Theory/OOP/Theory/Class|Class]] dùng để khởi tạo ra các loader là một [[Iterable]] mà sẽ trả về 2 [[Tensor]] mỗi lần duyệt qua, chính là X_batch (các mẫu) và y_batch (class của các mẫu)
```python
train_loader = DataLoader(
​	<Dataset_Object>,
​	batch_size = <kích_thước_batch>,
​	shuffle = False,
​	num_workers=os.count_cpu(),
​	pin_memory = False 
)

for epoch in range(epochs):
​	for X_batch, y_batch in train_loader:
​	​	...
```
với các tham số:
- với dataset_object là một [[1. Work/Theory/OOP/Theory/Object|Object]] có thể lấy từ các nguồn như output của [[ImageFolder]], ... 
- shuffle: xáo trộn các mẫu trước khi tạo các batch 
- pin_memory: bật tham số này giúp việc đem Tensor/Model qua GPU nhanh hơn, giúp việc training nhanh (xem thêm ở [[huấn luyện model trên gpu]])



> [!note]
> len(train_loader) sẽ trả về số lượng batch 



