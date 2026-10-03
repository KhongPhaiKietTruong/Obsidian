```python
train_dir = Path("datasets/pizza_steak_sushi/train")

class_names = train_data.classes #train_data là ImageFolder object 
samples_each_class = []

for idx, item in enumerate(train_dir.iterdir()):
    if item.is_dir():
        samples_each_class.append(len(os.listdir(item)))

samples_each_class
plt.bar(class_names, samples_each_class)
```
