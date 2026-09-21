```
train_dataset = TensorDataset(<dataset>)
```
dùng để khởi tạo một [[Object (Đối tượng)|object]] dataset để truyền vào [[DataLoader]] 

train_dataset sẽ là một [[Iterable]] trả về 2 [[Tensor]] mỗi lần, tương ứng mới một batch của các [[Features]] và một batch của [[Target Value]]

