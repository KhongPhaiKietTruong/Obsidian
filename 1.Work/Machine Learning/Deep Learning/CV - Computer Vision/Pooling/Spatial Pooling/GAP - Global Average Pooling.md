## Định nghĩa
GAP là [[Average Pooling]] với pool size = [[Spatial Size]] của [[Feature Map]], output sẽ là một feature map có spatial size bằng 1 
ví dụ: (32, 512, 244, 244) -> GAP -> (32, 512, 1, 1)
## Code 
```python
nn.AdaptiveAvgPool2d((1, 1))
```
