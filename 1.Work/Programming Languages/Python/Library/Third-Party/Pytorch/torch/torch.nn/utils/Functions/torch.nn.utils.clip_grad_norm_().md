dùng để thực hiện [[Gradient Clipping]]
cú pháp:
```python
torch.nn.utils.clip_grad_(mode.parameters(), max_norm)
```
với:
- max_norm là ngưỡng norm tối đa của [[Gradient]] 

> [!NOTE]
> -  clip\_grad\_norm\_() là phiên bản cải tiến của torch.nn.utils.clip\_grad\_norm() (đã bị lỗi thời)
> 

