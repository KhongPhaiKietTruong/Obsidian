## Định Nghĩa 
train_test_split là một hàm dùng để chia thành các tập dữ liệu như train, val, test 
## Cú Pháp 
```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X, 
    y, 
    test_size=0.2, 
    random_state=42, 
    shuffle=True, 
    stratify=y
)
```
với:
- X là data
- y là các labels 
- test_size: tỉ lệ mẫu chia cho [[Test Set]] 
- random_state: cố định seed 
- stratify: nhận vào [[List]] / [[Series]] chứa nhãn của **từng** mẫu dữ liệu 

> [!NOTE] 
> X, y truyền vào là dạng dữ liệu gì thì output cho ra của hàm train_test_split cũng cho ra dạng như vậy nhưng thường là [[DataFrame]] 

## Sự khác biệt với random_split 
Ta thường dùng train_test_split khi training set đi kèm với một file .csv thể hiện cho từng mẫu dữ liệu, sau khi tách xong thì truyền từng DataFrame đó vào [[torch.utils.data.Dataset]] và tạo [[torch.utils.data.DataLoader]] cho từng cái 

