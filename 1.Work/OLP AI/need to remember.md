lí thuyết:
- Torch biểu diễn ảnh có dạng (B, C, H, W) hoặc (C, H, W)
- OpenCV mặc định làm việc với ảnh theo quy ước (H, W, C)
- Numpy/PIL làm việc với ảnh theo quy ước (H, W, C)
- khi augment, cần phải augment khi cả train lẫn cả test (lúc test thì không biến đổi ngẫu nhiên, mà chỉ đưa dữ liệu về cùng dạng với lúc train)
- dữ liệu đầu vào khi đưa vào thực hiện augment phải đúng định dạng (B, C, H, W) của pytorch 
- [[torch.utils.data.random_split()]] trả về [[torch.utils.data.Subset]]
- lr của AdamW thường là 5e-4 đến 1e-3  và weight decay = 1e-3
- nếu dùng torch.transforms, các thao tác tăng cường được thực hiện ngay trên PIL Image còn nếu dùng torch.transforms.v2 thì các thao tác tăng cường có thể thực hiện ngay trên PIL Image hoặc trên Tensor (với điều kiện là tensor đó phải đúng định dạng (.., C, H, W))
- trong classification, ta có thể sử dụng ảnh với kích thước nhỏ (224, 224) nhưng ở task như detection và segmentation, ta cần kích thước ảnh lớn hơn (là bội số của 32)

chuyển PIL Image thành Tensor 

torch.stack()
torch.mean()
torch.max()
torch.linspace()
torch.cat() 
torch.nn.functional.softmax  

torchvision.tv_tensors.Image
torchvision.tv_tensors.BoundingBoxes 
torchvision.tv_tensors.Mask 

torch.optim.lr_scheduler.ConsineAnnealingLR 
Tensor.permute 
Tensor.view 
Tensor.squeeze
Tensor.unsqueeze 

next(iter(train_loader))

### Templates 
sử dụng kiến trúc resnet
đóng băng các layer 
thay đổi layer cuối 
resnet.children 
### Techniques 
stratified split 