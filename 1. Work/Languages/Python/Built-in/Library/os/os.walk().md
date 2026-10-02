os.walk() là một [[Method]] giả về một [[Generator]] giúp duyệt ta tất cả folder trong folder ta chỉ định và trả về các biến 
```python 
for dirpath, dirnames, filenames in os.walk(path)
​	    print(f"There are {len(dirnames)} directories and {len(filenames)} images in '{dirpath}'.")

#output
# There are 0 directories and 19 images in 'data/pizza_steak_sushi/test/steak'.
# There are 0 directories and 31 images in 'data/pizza_steak_sushi/test/sushi'.
# There are 0 directories and 25 images in 'data/pizza_steak_sushi/test/pizza'.
```
với:
- path có thể là một Path object của thư viện pathlib 
- dirpath là đường dẫn đang xét 
- dirnames: một [[List]] tên của các folder nằm trong dirpath 
- filenames: một list tên các file 