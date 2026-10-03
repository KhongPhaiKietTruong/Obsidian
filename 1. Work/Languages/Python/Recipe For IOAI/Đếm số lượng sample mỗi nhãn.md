```python
train_dir = Path("datasets/pizza_steak_sushi/train")

counts = Counter(train_data.targets)
class_names = train_data.classes
samples_each_class = [counts[i] for i in range(len(class_names))]

samples_each_class
plt.bar(class_names, samples_each_class)
```
