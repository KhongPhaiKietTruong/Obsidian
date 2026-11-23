optimizer.param_groups là một [[List]] chứa các [[Dictionary]] chứa các [[Hyperparameter]] của optimizer (mỗi dict là một group), thường được sử dụng để lấy ra [[Effective Learning Rate]] hiện tại khi dùng [[Learning Rate Scheduler]] 
```python
for X, y in train_loader:
	...
	 # Get current LR
    current_lr = optimizer.param_groups[0]['lr']
    
    print(
        f"Epoch {epoch+1}/{num_epochs} | "
        f"Val Loss: {val_loss:.4f} | "
        f"LR: {current_lr:.7f}"
    )
```