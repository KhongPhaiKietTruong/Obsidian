```
train_dataset = TensorDataset(<dataset>)

for X_batchbatch, y_batch in 
```
dùng để khởi tạo một [[Object (Đối tượng)]] dataset để truyền vào [[DataLoader]] 

train_dataset sẽ là một [[Iterable]] trả về 2 [[Tensor]] mỗi lần, tương ứng mới một batch của các [[Features (Đặc Trưng)]] và một batch của [[Target variable - Ground Truth (Giá Trị Thực Tế)]]

