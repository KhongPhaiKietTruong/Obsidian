được sử dụng để:
- chuyển ảnh thành [[Tensor]]: (H, W, C) -> (C, H, W)
- đưa giá trị pixel từ \[0, 255] về \[0, 1]
cú pháp:
```python
transforms.ToTensor()
```