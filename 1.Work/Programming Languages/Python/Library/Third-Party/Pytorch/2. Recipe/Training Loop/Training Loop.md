Hàm train_model nhận vào 9 tham số 
lưu ý: phải có save checkpoint
tuỳ chọn: có thêm patience 
```python
def train_model(model, train_dataloader, val_dataloader, criterion, optimizer, device, scaler, scheduler, epochs):
	 history = {
        "train_loss": [],
        "train_acc": [],
        "eval_loss": [],
        "eval_acc": []
    }	
    for epoch in range(num_epochs):
        train_metrics = train_epoch(
            model, train_loader, device,
            criterion, optimizer, scaler
        )
		
        eval_metrics = eval_epoch(
            model, val_loader, device,
            criterion, scaler
        )

        if scheduler is not None:
            scheduler.step()

        # Lưu metrics
        for key in history:
            if key.startswith("train_"):
                history[key].append(train_metrics[key])
            else:
                history[key].append(eval_metrics[key])

        print(
            f"Epoch [{epoch+1}/{num_epochs}] "
            f"| Train Loss: {train_metrics['train_loss']:.4f} "
            f"| Train Acc: {train_metrics['acc']:.4f} "
            f"| Val Loss: {eval_metrics['eval_loss']:.4f} "
            f"| Val Acc: {eval_metrics['acc']:.4f}"
        )

    return history
```