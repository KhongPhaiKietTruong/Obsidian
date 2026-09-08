sử dụng hàm rand(<tuple_kích_trước_tensor>) để tạo tensor có giá trị ngẫu nhiên tuân theo [[Uniform distribution (Phân Phối Đều)]] trong khoảng \[0, 1)

```python 
random_tensor = torch.rand((2, 2))
print(random_tensor)

output:
tensor([[0.2773, 0.9477],
        [0.6993, 0.4138]])
```