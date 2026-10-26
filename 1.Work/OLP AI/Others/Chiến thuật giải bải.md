1. cải tiến DataLoader, thêm 3 tham số: pin_memory, persistent_worker, prefetch_factor 
2. thêm model = torch.compile(model)
3. thêm non_blocking=True vào to()