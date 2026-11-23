## Định Nghĩa
Learning Rate Scheduler là cách thực hiện cụ thể của [[Learning Rate Decay]] theo cơ chế điều chỉnh [[Base Learning Rate]] theo thời gian huấn luyện ([[Epoch]], Batch, ...), ở thời gian đầu, với [[Weight]] ngẫu nhiên, ta cần lr lớn ngay từ đầu (hoặc dần dần trở nên lớn) để nhanh tiến về điểm cực tiểu, khi trải qua một khoảng thời gian, ta cần lr nhỏ lại để tránh bị dao động/phân kì 
có nhiều loại scheduler khác nhau như:
- [[1.Work/Programming Languages/Python/Library/Third-Party/Pytorch/torch/torch.optim/torch.optim.lr_scheduler/1. Class/CosineAnnealingLR|CosineAnnealingLR]] 
- [[Warmup]]