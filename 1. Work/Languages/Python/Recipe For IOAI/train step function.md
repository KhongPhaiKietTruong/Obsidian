```python
def train_step(model, dataloader, device):
    model.train()
    train_loss = 0
    acc = 0
    total_samples = 0
    for X_batch, y_batch in dataloader:
        # bring to gpu
        X_batch = X_batch.to(device)
        y_batch = y_batch.to(device)
        # forward pass
        logits = model(X_batch)
        # calc loss 
        loss = loss_fn(logits, y_batch)
        train_loss += loss 
        # calc grad
        optimizer.zero_grad()
        loss.backward()
        # update 
        optimizer.step()
        # calc acc 
        preds = logits.argmax(dim=1)
        acc =+ (preds==y_batch).sum().item() 
        total_samples += X_batch.shape[0]
        
    train_loss /= len(dataloader)
    acc = correct / total_samples 
    print(f'train loss: {train_loss:.2f} | train acc: {acc*100:.2f}')
```