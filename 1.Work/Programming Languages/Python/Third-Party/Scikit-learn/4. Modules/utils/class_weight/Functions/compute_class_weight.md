dùng để tính trọng số cho từng class (áp dụng trong [[Class-Weighted Loss]] và các biến thể khác)
```python
from sklearn.utils.weight import compute_class_weight 

weights = compute_class_weight(
    class_weight='balanced',
    classes=np.unique(y_train),
    y=y_train
)
```
với:
- class_weight: chỉ định cách tính trọng số (mặc định là 'balanced' - chuẩn hóa nghịch đảo tuần suất)
- classes: mảng chứa tên các class phân biệt 
- y: mảng chứa nhãn của từng mẫu trong tập huấn luyện 