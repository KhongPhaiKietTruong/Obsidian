```python
with zipfile.ZipFile('<zipfile_name>', 'r') as zf:
​	zf.extractall(path='<folder_name>')
```
với:
- zipfile_name: là file zip mà ta muốn giải nén 
- folder_name: là folder chứa dữ liệu được giải nén 

> [!NOTE] Notes
> method extractall() sẽ tự tạo folder chứa dữ liệu được giải nén ra 
