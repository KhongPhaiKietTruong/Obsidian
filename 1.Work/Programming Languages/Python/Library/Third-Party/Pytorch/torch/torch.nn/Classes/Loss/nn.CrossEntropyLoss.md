## Định nghĩa 
nn.CrossEntropyLoss là một [[1.Work/OOP/Theory/Class|Class]] dùng để khởi tạo hàm [[Cross-Entropy Loss]] 
nhận vào [[Vector]] các [[Logits]], [[Ground Truth]] và cho ra [[Penalty]] ([[Loss Function]])

CrossEntropyLoss là sự kết hợp của [[nn.NLLLoss]]
```python
nn.CrossEntropyLoss(weight: torch.Tensor, label_smoothing: float=0.0)
```
với:
- weight: nhận vào một [[Tensor]] chứa các giá trị chỉ định hệ số phạt của từng lớp, vị trí nào của class nào là do ta quy định trong phần tạo Custom Dataset (hoặc nếu dùng [[torch.utils.data.ImageFolder]] thì lấy nó từ [[ImageFolder.cls_to_idx]])
- label smoothing: chỉ định giá trị cho [[Label Smoothing]] (thường là 0.1)

## Code

### Class-index
```python
logits = torch.tensor([5, 7, 8, -3, 6 ,7], dtype=torch.float) # cac logits model du doan ra 
target = torch.tensor([2]) # vi tri cua nhan ground truth 
loss = criterion(logits, target) # output: 0.6
```
### One-hot Encoding Target
```python
logits = torch.tensor([5, 7, 8, -3, 6 ,7], dtype=torch.float)
target = torch.tensor([0, 0, 1, 0, 0, 0], dtype=torch.float)
loss = criterion(logits, target) # output: 0.6 
```
### Segmentation
```python
logits = torch.randn(1, 2, 2, 2) #(B, C, W, H)
mask = torch.tensor([
    [
        [0, 1],
        [1, 0]
    ]
], dtype=torch.long) # (B, W, H)
loss = criterion(logits, mask)

```


> [!WARNING] 
> - bên trong nn.CrossEntropy đã có sẵn lớp softmax, nên ta chỉ truyền vào logits 
> - weight phải trên cùng thiết bị với model, nếu model nằm trên cude thì cần chuyển tensor weight lên cuda 
