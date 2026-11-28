dùng để trả về [[Tensor]] chứa một phần tử là tổng giá trị của các phần tử của tensor gọi [[Method]] này 
```python
a = torch.Tensor([1, 2, 3])
b = a.sum(dim=0)
print(b)
# ouput:
# Tensor([6]) 
```

```python
a = torch.Tensor([
    [1, 2, 3],
    [4, 5, 6]
])

b = a.sum(dim=0)

print(b)

# Output:
# tensor([ 5., 7., 9.])
```