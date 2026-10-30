lí thuyết:
- Torch biểu diễn ảnh có dạng (B, C, H, W) hoặc (C, H, W)
- OpenCV mặc định làm việc với ảnh theo quy ước (H, W, C)
- Numpy/PIL làm việc với ảnh theo quy ước (H, W, C)
- khi augment, cần phải augment khi cả train lẫn cả test (lúc test thì không biến đổi ngẫu nhiên, mà chỉ đưa dữ liệu về cùng dạng với lúc train)
- dữ liệu đầu vào khi đưa vào thực hiện augment phải đúng định dạng (B, C, H, W) của pytorch 
- [[torch.utils.data.random_split()]] trả về [[torch.utils.data.Subset]]
- lr của AdamW thường là 5e-4 đến 1e-3  và weight decay = 1e-3
- nếu dùng torch.transforms, các thao tác tăng cường được thực hiện ngay trên PIL Image (trên shape (H, W, C)) còn nếu dùng torch.transforms.v2 thì các thao tác tăng cường phải được thực hiện trên (C, H, W)
torch.stack()
torch.mean()
torch.max()
torch.linspace()
torch.cat 

Tensor.permute 
Tensor.view 

