Kí hiệu: $J(\hat{y}, y)$
Dịch: Hàm Mất Mát
## Định Nghĩa 
Loss function là một hàm số cho ta biết rằng giá trị mà model dự đoán ra có độ lệch là bao nhiêu so [[Ground Truth]], nếu độ lệch lớn, loss function trả về giá trị [[Penalty]] phạt model cao, bắt model phải cố học để giá trị dự đoán của nó sát với ground truth 

## Các Loại Loss 
Có nhiều loại loss function khác nhau giành cho các vụ khác nhau, chủ yếu là gồm 2 loại chính:
- regression (dựa trên độ lệch giá trị)
- classification (dựa trên xác suất)

## Code 
Để dùng các loss function trong code, ta dùng các [[1.Work/OOP/Theory/Class|Class]] trong module [[torch.nn]] như: [[nn.CrossEntropyLoss]], [[nn.MSELoss]], ... 
ví dụ:
```python
loss_fn = nn.CrossEntropyloss()
logits = loss_fn(pred, target) # pred truoc roi moi toi target
```

> [!WARNING] 
> Mặc định các hàm loss trong nn nhận vào hai tham số là [[Predicted Value]] và [[Ground Truth]] **theo đúng thứ tự**

