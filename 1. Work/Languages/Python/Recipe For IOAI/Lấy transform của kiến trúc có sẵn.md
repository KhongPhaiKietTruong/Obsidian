```python
weights = ConvNeXt_Base_Weights.DEFAULT
base_transforms = weights.transforms()
mean = base_transforms.mean
std = base_transforms.std
crop_size = base_transforms.crop_size
train_transform = v2.Compose([
    v2.ToImage(),

    # size
    v2.RandomResizedCrop((224, 224)),
    v2.RandomHorizontalFlip(),
    # augment
    v2.RandAugment(4),

    v2.ToDtype(torch.float, True),
    v2.Normalize(mean, std)
])
```
