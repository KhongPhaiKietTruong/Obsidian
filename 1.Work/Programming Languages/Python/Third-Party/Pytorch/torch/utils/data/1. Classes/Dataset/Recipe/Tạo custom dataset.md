tạo một [[1.Work/OOP/Theory/Class|Class]] thừa kế từ [[torch.utils.data.Dataset]] và thực hiện ghi đè lên 3 method là
- \_\_init__(): hàm [[Constructor]], nhận vào tập training set và pipeline transform 
- \_\_len()\_\_: trả về số lượng mẫu có trong [[Training Set]]  
- \_\_getitem()__ : trả về một mẫu dữ liệu kèm nhãn của nó 
len thì trả về số lượng mẫu có trong tập dữ liệu
getitem() thì trả về một tuple (tensor, label) lần lượt thể hiện [[Tensor]] của mẫu được lấy ra và nhãn của mẫu đó 

ví dụ:
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