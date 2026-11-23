## Định Nghĩa
Gradual Unfreezing là một chiến thuật huấn luyện trên lớp cuối của model một vài epoch rồi mới train trên toàn bộ lớp để tránh các trọng số ngẫu nhiên của lớp khi mới được khởi tạo phá hỏng pretrained [[Weight]] của backbone vốn đã khá tốt 

## Code 
```python
for param in model.backbone.parameters():
    param.requires_grad = False

# Embedding head vẫn được train
for param in model.fc.parameters():
    param.requires_grad = True
    
def unfreeze_layers(model):
    for param in layer.parameters():
        param.requires_grad = True
            
for epoch in range(num_epochs):
    if epoch == 5:
        unfreeze_layers(model)

    train_one_epoch(model, train_loader, optimizer, criterion)

    validate(model, val_loader)
```