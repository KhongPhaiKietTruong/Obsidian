Có hai cách để thực hiện việc này
## Train trên một batch 
```python
img, ques, ans = next(iter(train_loader))
for epoch in range(10):
    train_metrics = train_epoch(
        model=model,
        dataloader=[(img, ques, ans)],
        device=device,
        criterion=criterion,
        optimizer=optimizer,
        scaler=scaler
    )

    print(
        f"Epoch [{epoch + 1}/50] "
        f"Loss: {train_metrics['train_loss']:.4f} | "
        f"Acc: {train_metrics['train_acc']:.4f}"
    )
```

## Train trên số mẫu chỉ định
```python
from torch.utils.data import Subset, DataLoader

small_dataset = Subset(train_dataset, range(1000))

small_loader = DataLoader(
    small_dataset,
    batch_size=16,
    shuffle=True,
    collate_fn=collate_fn
)
```