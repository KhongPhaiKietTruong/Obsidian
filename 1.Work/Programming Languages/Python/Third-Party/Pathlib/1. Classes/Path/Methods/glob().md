glob() là một [[Method]] trả về một [[List]] chứa tên của các folder/file thoả mãn yêu cầu 
```python
import glob

# lay tat ca anh meo 
img_path = glob.glob('dataset/cat/*.jpg')

# lay tat ca anh dong vat 
img_path = glob.gllob('dataset/**/*.jpg', recursive=True)
```
với:
- * là khớp với 0 hoặc nhiều kí tự bất kì
- . là khớp với 1 kí tự bất kì 
