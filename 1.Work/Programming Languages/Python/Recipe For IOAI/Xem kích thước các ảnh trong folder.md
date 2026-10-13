```python
for item in (TRAIN_DIR).rglob('*.jpg'):
    with Image.open(item) as img:
        print(img.size)
```