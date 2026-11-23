Image.Folder.cls_to_idx trả về một [[Dictionary]] chứa tên các tên nhãn và số nhãn của nó sau khi được ánh xạ 
```python
print(train_dataset.class_to_idx)
#output:
# {
#     'cat': 0,
#     'chicken': 1,
#     'dog': 2
# }
```