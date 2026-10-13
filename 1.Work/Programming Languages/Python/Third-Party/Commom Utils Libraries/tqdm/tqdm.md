dùng để hiển thị thanh trạng thái của một vòng lặp 
```python
from tqdm import tqdm

for i in tqdm(range(100)):
​	print(i)

#output:
#100%|██████████| 100/100 [00:00<00:00, 15768.06it/s]
```