## Định Nghĩa 
from_pretrained là một [[Method]] nằm trong nhiều [[1.Work/OOP/Theory/Class|Class]] như [[AutoImageProcessor]], [[AutoConfig]], ... (các class có tiền tố Auto nói chung) được dùng để tải thông tin từ một model về và tạo ra một [[1.Work/OOP/Theory/Object|Object]] chứa các thông tin đó 
cú pháp:
```python
from_pretrained(pretrained_model_name_or_path=None, *kwargs)
```
với:
- pretrained_model_name_or_path: nhận vào một [[Model ID]] hoặc một đường dẫn đến folder nằm trong snapshots của repo HF trong cache (xem thêm ở [[Hugging Face Cache]]) 
các tham số phổ biến khác như:
- torch_dtype: khai báo kiểu dữ liệu của trọng số (torch.float32, torch.float16, ...)
- device_map: quy định nơi đặt model (auto, cpu, gpu, ...), hoàn toàn có thể thay thế tham số này bằng [[1.Work/Programming Languages/Python/Library/Third-Party/Pytorch/torch/torch.nn/Classes/nn.Module/Method/to()|to()]]. Tuy nhiên, nếu load model nặng thì device_map có ích hơn vì nó tự phân bổ ra nhiều gpu 
- local_files_only: chỉ đọc từ file cache local, tắt internet, không đọc từ trên HF 