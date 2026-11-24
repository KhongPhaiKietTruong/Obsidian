## Định Nghĩa 
Để tạo một custom dataset trong pytorch, ta tạo một [[1.Work/OOP/Theory/Class|Class]] thừa kế từ [[torch.utils.data.Dataset]] và bắt buộc thực hiện ghi đè lên 3 [[Method]] là
- \_\_init__(): hàm [[Constructor]], nhận vào tập training set (file csv, ...) và pipeline transform 
- \_\_len()\_\_: trả về số lượng mẫu có trong [[Training Set]]  
- \_\_getitem()__ : trả về những gì cần thiết để thực hiện quá trình train/eval (ví dụ như trong [[Supervised Learning]] thì trả về một mẫu và nhãn của nó, [[Unsupervised Learning]] thì chỉ trả về mẫu dữ liệu, ... )

code ví dụ:
```python
class BrainMriDataset(Dataset):
    def __init__(self, df, transforms):
        
        self.df = df
        self.transforms = transforms
        
    def __len__(self):
        return len(self.df)
    
    def __getitem__(self, idx):
        image = cv2.imread(self.df.iloc[idx, 1])
        mask = cv2.imread(self.df.iloc[idx, 2], 0)
        augmented = self.transforms(image=image, mask=mask)
        image = augmented['image']
        mask = augmented['mask']   
        
        return image, mask
```