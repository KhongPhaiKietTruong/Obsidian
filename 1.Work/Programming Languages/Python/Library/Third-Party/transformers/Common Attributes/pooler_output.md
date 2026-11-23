last_hidden_state là [[Attribute]] trả về vector feature của [[Feature Map]] cuối cùng đã qua [[GAP - Global Average Pooling]] sau khi truyền input ảnh vào một model

```python
outputs = backbone(pixel_values=images)

feature_map = outputs.last_hidden_state
pooled_features = outputs.pooler_output
# output: 
feature_map.shape
# [32, 2048, 7, 7]

pooled_features.shape
# [32, 2048]
```