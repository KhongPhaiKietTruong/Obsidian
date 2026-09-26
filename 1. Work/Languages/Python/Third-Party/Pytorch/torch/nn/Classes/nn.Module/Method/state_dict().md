là một [[Method]] giúp trả về một [[1. Work/Theory/OOP/Theory/Object]] thể hiện trạng thái hiện tại của model, bao gồm các tham số được học như [[Weight]], [[Bias]], ... 

state_dict() thường được dùng để:
lưu trọng số của model sau khi train vào file (xem thêm ở [[Lưu trọng số vào file]] 

```python
torch.save(model.state_dict(), "model.pth")
```

