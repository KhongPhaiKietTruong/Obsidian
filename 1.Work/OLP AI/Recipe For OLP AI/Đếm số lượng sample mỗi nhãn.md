sử dụng [[os.walk()]]:
```python 
for dirpath, dirnames, filenames in os.walk(path)
​	    print(f"There are {len(dirnames)} directories and {len(filenames)} images in '{dirpath}'.")
```

output:
```
There are 0 directories and 19 images in 'pizza_steak_sushi/test/steak'.
There are 0 directories and 31 images in 'pizza_steak_sushi/test/sushi'.
There are 0 directories and 25 images in 'pizza_steak_sushi/test/pizza'.
```