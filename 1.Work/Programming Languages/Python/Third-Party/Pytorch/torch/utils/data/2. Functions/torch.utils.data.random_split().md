làm một hàm dùng để chia một [[torch.utils.data.Dataset]] thành các [[torch.utils.data.Subset]] không chứa mẫu trùng lặp 
```python
# Cách 1: Chia theo tỉ lệ phần trăm (tổng = 1.0) 
train_set, val_set, test_set = random_split( 
​	dataset, lengths=[0.8, 0.1, 0.1],
​	generator=torch.Generator().manual_seed(42) # Cố định seed để đảm bảo tính tái lập (reproducibility) 
) 
# Cách 2: Chia theo số lượng mẫu cụ thể (tổng phải đúng bằng len(dataset))
train_set, val_set = random_split(dataset, lengths=[8000, 2000])
```