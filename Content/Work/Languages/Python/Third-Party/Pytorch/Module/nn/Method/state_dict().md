là một [[Method (Phương thức)]] giúp trả về trạng thái hiện tại của model, bao gồm các tham số được học như [[Weight (Trọng Số) w]], [[Bias]], ... 

state_dict() thường được dùng để:
lưu trọng số của model sau khi train vào file 
```python 
torch.save(model.state_dict(), "model.pth")
```

load trọng số vào một model