viết tắt của: batch matrix multiplication 
```python
# Batch size B = 16
mat1 = torch.randn(16, 32, 64)
mat2 = torch.randn(16, 64, 128)

out = torch.bmm(mat1, mat2)

print(out.shape)  # torch.Size([16, 32, 128])
```