hàm này dùng để chuyển [[Tensor]] sang cpu, cách này hoàn toàn tương tự với chuyển sang cpu bằng [[1. Work/Languages/Python/Third-Party/Pytorch/torch/1. Classes/torch.Tensor/1. Methods/to()|to()]] 
```python
pred_np = pred.detach().cpu().numpy() 
```