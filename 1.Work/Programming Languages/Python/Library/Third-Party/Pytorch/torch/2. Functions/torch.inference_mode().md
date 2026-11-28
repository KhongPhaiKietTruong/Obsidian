torch.inferece_mode() dùng để đưa model vào trạng thái dự đoán

khi đó, ta sẽ thực hiện tắt các công việc liên quan đến [[Gradient]] để giảm thời gian tính toán, sử dụng ít dữ liệu hơn, ... bởi vì quá trình thực hiện đoán không cần đến việc tính gradient mà là chỉ thực hiện [[Forward Pass]] đồng thời cũng tắt [[Vanilla Drop Out]] và tính running mean, running std của các dạng norm

```python
with torch.inference_mode():
        for X, y in test_dataloader:
        ...
```
