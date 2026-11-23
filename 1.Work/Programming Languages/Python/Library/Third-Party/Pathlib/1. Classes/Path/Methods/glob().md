glob() là một [[Method]] trả về một [[Iterable]] chứa Path object là tên đường dẫn của các folder/file thoả mãn yêu cầu 
```python
from pathlib import Path 
root = Path('dataset/cat/')
# lay tat ca anh meo 
img_path = glob.glob('*.jpg')
```
với:
- * là khớp với 0 hoặc nhiều kí tự bất kì
- . là khớp với 1 kí tự bất kì 
