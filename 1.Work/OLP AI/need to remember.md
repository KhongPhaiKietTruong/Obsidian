lí thuyết:
- Torch biểu diễn ảnh có dạng (B, C, H, W) hoặc (C, H, W)
- OpenCV mặc định làm việc với ảnh theo quy ước (H, W, C)
- khi augment, cần phải augment khi cả train lẫn cả test (lúc test thì không biến đổi ngẫu nhiên, mà chỉ đưa dữ liệu về cùng dạng với lúc train)
- dữ liệu đầu vào khi đưa vào thực hiện augment phải đúng định dạng (B, C, H, W) của pytorch 
- [[torch.utils.data.random_split()]] trả về [[torch.utils.data.Subset]]
- lr của AdamW thường là 1e-4...5e-4 đến 1e-3  và weight decay = 1e-3
- nếu dùng torch.transforms, các thao tác tăng cường được thực hiện ngay trên PIL Image còn nếu dùng torch.transforms.v2 thì các thao tác tăng cường có thể thực hiện ngay trên PIL Image hoặc trên Tensor (với điều kiện là tensor đó phải đúng định dạng (.., C, H, W))
- trong classification, ta có thể sử dụng ảnh với kích thước nhỏ (224, 224) nhưng ở task như detection và segmentation, ta cần kích thước ảnh lớn hơn (là bội số của 32)

channel attention -> image classification 
spatial attention -> detection / segmentation 

các class nằm trong module torch.nn: nn.Sigmoid()

chuyển PIL Image thành Tensor 
mở ảnh bằng PIL, xem kích thước ảnh
duyệt qua các ảnh trong một folder 
PIL.Image.size trả về (W, H)

sklearn.utils.class_weight.compute_class_weight 

torch.stack()
torch.mean()
torch.max()
torch.linspace()
torch.cat() 
torch.stack()
torch.nn.functional.softmax  

torchvision.tv_tensors.Image
torchvision.tv_tensors.BoundingBoxes 
torchvision.tv_tensors.Mask 

torch.optim.lr_scheduler.ConsineAnnealingLR 
Tensor.permute 
Tensor.view 
Tensor.squeeze
Tensor.unsqueeze 
Tensor.max()
Tensor.mean()
Tensor.flatten()

next(iter(train_loader))

### Templates 
sử dụng kiến trúc resnet
đóng băng các layer 
thay đổi layer cuối 
resnet.children() 
### Techniques 
stratified split 
GPU enhanced 