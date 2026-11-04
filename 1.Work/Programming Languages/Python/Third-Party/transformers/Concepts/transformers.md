thiết kế của thư viện transformers gồm 5 loại [[1.Work/OOP/Theory/Class|Class]] chính:
- Configuration: dùng để khai báo các [[Hyperparameter]] của một model 
- Model: khai báo kiến trúc model 
- Preprocessor: bộ tiền xử lí dữ liệu (Tokenizer cho text, ImageProcessor cho ảnh, ...)
- Pipeline: dùng để thực hiện suy luận 
- Trainer:: dùng để thực hiện huấn luyện, fine-tune model 