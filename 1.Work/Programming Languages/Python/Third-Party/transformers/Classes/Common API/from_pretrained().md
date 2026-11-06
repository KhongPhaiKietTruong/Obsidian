là một [[Method]] nằm trong nhiều [[1.Work/OOP/Theory/Class|Class]] như [[AutoImageProcessor]], [[AutoConfig]], Auto*, ... được dùng để tải thông tin từ một model về và tạo ra một [[1.Work/OOP/Theory/Object|Object]] chứa các thông tin đó 
cú pháp:
```python
from_pretrained(pretrained_model_name_or_path=None, *kwargs)
```
các tham số phổ biến khác như:
- torch_dtype: khai báo kiểu dữ liệu của trọng số (torch.float32, torch.float16, ...)
- device_map: cơ chế phân bổ model lên phần cứng (auto, cpu, gpu, ...)
- local_files_only: chỉ đọc từ file cache local, tắt internet, không đọc từ trên HF 