## Định Nghĩa 
Transformers là một thư viện của HuggingFace cung cấp các kiến trúc deep learning cùng với các API để dễ dàng giải quyết các bài toán AI 

thiết kế của thư viện transformers gồm 5 loại [[1.Work/OOP/Theory/Class|Class]] chính:
- Configuration: dùng để khai báo các [[Hyperparameter]] của một model 
- Model: khai báo kiến trúc model 
- Preprocessor: bộ tiền xử lí dữ liệu (Tokenizer cho text, ImageProcessor cho ảnh, ...)
- Pipeline: dùng để thực hiện suy luận 
- Trainer:: dùng để thực hiện huấn luyện, fine-tune model 

## Các Kiến Trúc Phố Biến 
Trong transformers có rất nhiều kiến trúc phổ biến cho nhiều tác vụ khác nhau
### CNN-Based
- [[1.Work/Machine Learning/Deep Learning/CV - Computer Vision/Architecture In CV/Resnet/ResNet|ResNet]]
- [[ConvNeXt]]
- [[EfficientNet]]
### Transformer-Based 
- [[ViT]]
- [[Swin Transformer]]
- [[DINO]]v2
### Hybrid 
- ViT Hybrid 
- MaskFormer
- Mask2Former
- UPerNet

## Cách Sử Dụng Cơ Bản 
để sử dụng được model thì ta cần 2 class: một cái đại diện cho config của model đó và một cái đại diện cho kiến trúc model đó 