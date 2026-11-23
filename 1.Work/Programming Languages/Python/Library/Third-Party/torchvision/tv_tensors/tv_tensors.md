Là một module gồm các class chuyên biệt [[tv_tensors.BoundingBoxes]], [[tv_tensors.Mask]], ... cho các nhãn đặc biệt như [[Bounding Box]], [[Segmentation Mask]], ...


> [!WARNING] 
> khi khởi tạo [[Instance]] bằng các class này, ta phải truyền vào [[Argument]] là [[tv_tensors.Image]] 
> 

ví dụ:
```python
from torchvision import tv_tensors 
from torchvision.transforms import v2
from PIL import Image

mask = Image.open('cat_mask.jpg') # img la PIL 
mask = v2.ToImage()(mask) # chuyen PIL thanh tv_tensors.Image
img = tv_tensors.Mask()(mask)
```

