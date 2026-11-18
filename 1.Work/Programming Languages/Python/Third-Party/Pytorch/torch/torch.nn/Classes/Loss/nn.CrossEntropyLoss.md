## Định nghĩa 
nn.CrossEntropyLoss là một [[1.Work/OOP/Theory/Class|Class]] dùng để khởi tạo hàm [[Cross-Entropy Loss]] 
nhận vào [[Vector]] các [[Logits]], [[Ground Truth]] và cho ra [[Penalty]] 
CrossEntropyLoss là sự kết hợp của [[nn.NLLLoss]]
```python
nn.CrossEntropyLoss(weight: torch.Tensor, label_smoothing: float=0.0)
```
với:
- weight: nhận vào một [[Tensor]] chứa các giá trị chỉ định hệ số phạt của từng lớp 
- label smoothing: chỉ định giá trị cho [[Label Smoothing]] 