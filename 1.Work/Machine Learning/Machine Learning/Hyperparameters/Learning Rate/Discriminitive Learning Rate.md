LR: learning rate
***
## Định Nghĩa 
Discriminitive LR là kĩ thuật áp dụng LR khác nhau cho các layer/stage trong cùng một mô hình 
thường thì model được chia làm hai phần là pretrained [[Backbone]] và [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]], ta thường để [[Base Learning Rate]] của backbone thấp hơn so với head vì backbone đã có pretrained [[Weight]] rồi nên chỉ cần điều chỉnh nhẹ
## Ứng Dụng
Kĩ thuật này thường được sử dụng khi thực hiện [[Fine-Tuning]] một model vì nó giúp hạn chế tình trạng [[Catastrophic Forgetting]] 

## Code 
```python
class MyModel(nn.Module):
    def __init__(self):
        super().__init__()

        self.backbone = resnet50(weights=ResNet50_Weights.DEFAULT)
        self.fc = nn.Linear(1000, 10)

    def forward(self, x):
        x = self.backbone(x)
        x = self.fc(x)
        return x
      
optimizer = torch.optim.AdamW([
    {
        "params": model.fc.parameters(),
        "lr": 1e-3
    },
    {
        "params": model.backbone.parameters(),
        "lr": 1e-5
    }
])
```