```python
class ImageFolderCustom(Dataset):
    def __init__(self, root_dir: Path, transforms: v2.Compose=None):
        self.root_dir = root_dir
        self.transforms = transforms
        # instances là một list gồm các path dẫn đến từng sample
        self.instances = list(Path(root_dir).rglob('*.jpg')) 

        self.classes = sorted([item.name for item in 
        self.root_dir.iterdir() if item.is_dir()])
        self.class_to_idx =  {cls_name: idx for idx, cls_name in ​	​	
        enumerate(self.classes)}
        
    def __len__(self):
        return len(self.instances)
        
    def __getitem__(self, idx):
        img_path = self.instances[idx]
        img = Image.open(img_path).convert('RGB')
        cls_name = img_path.parent.name
        label = self.class_to_idx[cls_name]
        if self.transforms: img = self.transforms(img)
        return img, label

    
```