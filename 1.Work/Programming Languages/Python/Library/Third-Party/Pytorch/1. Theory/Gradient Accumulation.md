Gradient Accumulation là cơ chế cho phép cộng dồn [[Gradient]] được tính trên nhiều batch lại rồi mới thực hiện cập nhật 

## Tại sao cần Gradient Accumulation
Giả sử bạn đang train mô hình và muốn sử dụng:
- Batch size = 32.
- GPU của bạn không đủ VRAM để chứa 32 samples cùng lúc.
Bạn có thể sử dụng Gradient Accumulation:
- Chia batch 32 thành 4 mini-batch.
- Mỗi mini-batch chứa 8 samples.
- Tính gradient trên từng mini-batch.
- Cộng dồn gradient của cả 4 mini-batch.
- Cập nhật weights một lần.