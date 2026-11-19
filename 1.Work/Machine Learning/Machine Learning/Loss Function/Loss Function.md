Kí hiệu: $L(\hat{y}, y)$
Dịch: Hàm Mất Mát
## Định Nghĩa 
Loss function là một hàm số cho ta biết rằng giá trị mà model dự đoán ra có độ lệch là bao nhiêu so với [[Ground Truth]], nếu độ lệch lớn, loss function trả về giá trị [[Penalty]] phạt model cao, bắt model phải cố học để giá trị dự đoán của nó sát với ground truth 

## Các Loại Loss 
Có nhiều loại loss function khác nhau dành cho các vụ khác nhau, một số loại chính:
### Regression Loss 
- [[SE Loss]]
- [[AE Loss]]
- [[Huber Loss]]
### Classification 
- [[Cross-Entropy Loss]] 
- [[Hinge Loss]]
### Metric Learning 
- [[Triplet Loss]] 
### Computer Vision 
- [[Dice Loss]]
## Miền Giá Trị 
với mỗi
## Code 
Để dùng các loss function trong code, ta dùng các [[1.Work/OOP/Theory/Class|Class]] trong module [[torch.nn]] như: [[nn.CrossEntropyLoss]], [[nn.MSELoss]], ... 
ví dụ:
```python
loss_fn = nn.CrossEntropyLoss()
loss = loss_fn(pred, target) # pred truoc roi moi toi target
```

> [!WARNING] 
> Mặc định các hàm loss trong nn nhận vào hai tham số là [[Predicted Value]] và [[Ground Truth]] **theo đúng thứ tự**

