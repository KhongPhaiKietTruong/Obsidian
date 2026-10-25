là class con của [[torch.utils.data.Dataset]] 
trong subset này thực chất chứa các con trỏ trỏ tới các mẫu trong Dataset chứ không tạo ra dữ liệu mới 

là [[1.Work/OOP/Theory/Class|Class]] trả về sau khi ta thực hiện hàm [[torch.utils.data.random_split()]] lên một [[torch.utils.data.Dataset]] thể hiện cho các tập con (như train, test, val)

khởi tạo Subset:
```python
torch.utils.data.Subset(Dataset, indices)
```
- với Dataset chính là class Dataset 
- indices là mảng chứa các chỉ số chỉ đến vị trí các mẫu muốn chọn trong Dataset 

