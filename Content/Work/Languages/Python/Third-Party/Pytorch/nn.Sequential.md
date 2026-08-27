đây là một [[class]] dùng để tạo ra một container chứa các [[Layer (Lớp)]] kế thừa từ [[nn.Module]], khác ở chỗ là class này đã tự định nghĩa hàm [[Forward Propogation (Lan Truyền Xuôi)]] thay vì phải tự định nghĩa như nn.Module, hàm forward của class này sẽ xử lí tuần tự từng layer từ trái qua phải và không có các logic phức tạp để bỏ qua layer nào
```python
x = torch.tensor([200.0, 17.0])
model = nn.Sequential(
    nn.Linear(2, 3),
    nn.Sigmoid(),
    nn.Linear(3, 1),
    nn.Sigmoid()
)
output = model(input)
print(output)
```