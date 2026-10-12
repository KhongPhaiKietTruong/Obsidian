tạo một [[1. Work/Theory/OOP/Theory/Class|Class]] thừa kế từ [[torch.utils.data.Dataset]] và thực hiện ghi đè lên 3 method là
- \_\_init__()
- \_\_len()__
- \_\_getitem()__  
len thì trả về số lượng mẫu có trong tập dữ liệu
getitem() thì trả về một tuple gồm 