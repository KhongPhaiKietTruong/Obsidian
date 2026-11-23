last_hidden_state là [[Attribute]] trả về [[Feature Map]] cuối cùng khi đi qua model của output sau khi truyền input ảnh vào một model
```python
outputs = backbone(pixel_values=images)

feature_map = outputs.last_hidden_state
pooled_features = outputs.pooler_output

print(feature_map.shape)
# [32, 2048, 7, 7]

print(pooled_features.shape)
# [32, 2048]
```