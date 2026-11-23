để khởi tạo một [[1.Work/OOP/Theory/Object|Object]] lưu trữ kiến trúc, các [[Hyperparameter]] của một model và có thể chỉnh sửa các hyperparameters đó 
ví dụ 
```python
from transformers import AutoConfig

config = AutoConfig.from_pretrained(
​	"bert-base-uncased", 
​	num_labels=5, 
​	hidden_dropout_prob=0.2, 
```

