```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X, 
    y, 
    test_size=0.2, 
    random_state=42, 
    shuffle=True, 
    stratify=None
)
```
với:
- X là data
- y là các labels 
- test_size: tỉ lệ mẫu chia cho [[Test Set]] 
- random_state: cố định seed 
- stratify: nhận vào mảng chứa nhãn của **từng** mẫu dữ liệu 

> [!NOTE] 
> X, y truyền vào như thế nào thì output của hàm train_test_split cũng tương tự vậy

