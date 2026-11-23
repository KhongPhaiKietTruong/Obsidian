## Định Nghĩa 
random_split() làm một hàm dùng để chia [[torch.utils.data.Dataset]] và trả về các [[torch.utils.data.Subset]] không chứa mẫu trùng lặp 
## Cú Pháp
```python
random_split(dataset, lengths, generator)
```
với:
- dataset là [[torch.utils.data.Dataset]] hoặc một [[List]], ... 
- lengths: một list chứa số lượng hoặc tỉ lệ mỗi tập (vd: \[0.8, 0.2])
- generator: dùng để cố định seed 
ví dụ:
```python
# Cách 1: Chia theo tỉ lệ phần trăm (tổng = 1.0) 
train_set, val_set, test_set = random_split( 
​	dataset, 
​	lengths=[0.8, 0.1, 0.1],
​	generator=torch.Generator().manual_seed(42) # Cố định seed để đảm bảo tính tái lập (reproducibility) 
) 
# Cách 2: Chia theo số lượng mẫu cụ thể (tổng phải đúng bằng len(dataset))
train_set, val_set = random_split(dataset, lengths=[8000, 2000])
```

## Sự khác biệt với train_test_split
Ta thường dùng random_split khi training set **không** có file .csv thể hiện cho từng mẫu dữ liệu mà chỉ có các folder chứa dữ liệu cho các lớp, ta bọc folder đó bằng [[torch.utils.data.Dataset]] rồi tách nó ra thành các [[torch.utils.data.Subset]] rồi tạo [[torch.utils.data.DataLoader]] với từng subset đó 