## Định Nghĩa 
DeepLabV3+ là một kiến trúc được thiết kế cho bài toán [[Semantic Segmentation]] với 3 thành phần chính:
- [[Encoder]] ([[Backbone]]): trích xuất [[Feature Representation]] bằng [[Dilated Convolution]] cho các [[Feature Map]] tương ứng với các [[Receptive Field]] khác nhau rồi gộp tất cả lại tạo thành high-level feature map ([[ASPP - Atrous Spatial Pyramid Pooling]]), output được cho ra bởi một vài lớp [[Convolution]] ban đầu thì là low-level feature map
- [[Decoder]]: gộp low-level và high-level feature map lại với nhau và cho ra kết quả cuối cùng 

![[Pasted image 20261119165556.png]]
## Code 
```python
from torchvision.models.segmentation import 
```