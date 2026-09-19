là một [[Method (Phương thức)]] giúp trả về một [[Object (Đối tượng)]] thể hiện trạng thái hiện tại của model, bao gồm các tham số được học như [[Weight]], [[Content/Work/Theory/Machine Learning/Fundamentals/Quantities/Bias]], ... 

state_dict() thường được dùng để:
lưu trọng số của model sau khi train vào file (xem thêm ở [[Lưu trọng số vào file]] 

```python
torch.save(model.state_dict(), "model.pth")
```

