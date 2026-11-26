collate_fn là hàm dùng để gom cách giá trị (được return từ class kế thừa [[torch.utils.data.Dataset]], tức [[Custom Dataset]]) thành cách batch để đưa vào model 
```python
def collate_fn(batch):
	return 
	
train_loader = DataLoader(train_dataset, collate_fn=collate_fn)
```