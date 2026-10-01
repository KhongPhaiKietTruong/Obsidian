## Định Nghĩa 
Cliping By Norm là kĩ thuật [[Gradient Clipping]] dựa trên [[L2-norm]] của [[Gradient]] dựa trên một ngưỡng c
- nếu $||g||_{2}$ < c thì giữ nguyên g (gradient)
- nếu $||g||_{2}$ > c thì:
$$
g_{new} = \frac{g_{old}c}{||g_{old}||_{2}}  
$$
## Ưu Điểm 
- Cliping by Norm không làm thay đổi hướng của gradient 

## Code 
nằm sau bước tính gradient 
```python
loss = criterion(outputs, targets)
optimizer.zero_grad()
loss.backward()
# Cliping Gradient by norm, c=1 la gia tri baseline co ban duoc khuyen dung
torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
```