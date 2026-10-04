```python
train_dir = Path("datasets/pizza_steak_sushi/train")

counts = Counter(train_data.targets)
class_names = train_data.classes
samples_each_class = [counts[i] for i in range(len(class_names))]

samples_each_class
plt.bar(class_names, samples_each_class)
```

sử dụng [[os.walk()]]:
```python 
for dirpath, dirnames, filenames in os.walk(path)
​	    print(f"There are {len(dirnames)} directories and {len(filenames)} images in '{dirpath}'.")

#output
# There are 0 directories and 19 images in 'data/pizza_steak_sushi/test/steak'.
# There are 0 directories and 31 images in 'data/pizza_steak_sushi/test/sushi'.
# There are 0 directories and 25 images in 'data/pizza_steak_sushi/test/pizza'.
```