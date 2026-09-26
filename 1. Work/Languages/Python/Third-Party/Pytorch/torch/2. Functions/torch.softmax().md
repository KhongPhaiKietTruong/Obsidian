là [[Function]] nhận vào [[Tensor]] gồm các [[Logits]] và trả ra xác suất của chúng 
tham khảo thêm công thức tính softmax: [[Softmax]] 
```python
import torch
logits = torch.tensor([2.0, 1.0, 0.0])

probs = torch.softmax(logits, dim=0)

print(probs)
# tensor([0.6652, 0.2447, 0.0900])

print(probs.sum())
# tensor(1.)
```

![[Pasted image 20260923172816.png]]