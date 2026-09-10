```python
train_loader = DataLoader(
​	<Dataset_Object>,
​	batch_size = <kích_thước_batch>
​	shuffle = <Boolean>
)
```

với dataset_object là một [[Object (Đối tượng)]] được khởi tạo bằng [[torch.utils.data.Dataset]] hoặc các class con của nó 

DataLoader là một [[Iterable]] mà sẽ trả về 2 giá trị mô


