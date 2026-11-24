nn.AdaptiveAveragePool2d dùng để áp dụng [[Average Pooling]] lên một [[Tensor]]

cú pháp: 
```python
nn.AdaptiveAveragePool2d(<target_size>)
```
với:
- target size là một [[Tuple]] thể hiện [[Spatial Size]] mong muốn 

code ví dụ: 
```python
feature_map = torch.randn(1, 2048, 224, 224)
feature_vector = nn.AdaptiveAvgPool2d((1, 1))(feature_map)
feature_vector.shape # (1, 2048, 1, 1)
```
