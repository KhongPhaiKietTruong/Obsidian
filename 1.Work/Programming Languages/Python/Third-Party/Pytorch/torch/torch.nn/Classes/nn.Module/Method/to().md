dùng để chuyển model qua bên gpu 

```python
model = LinearRegression().to(device, non_blocking=<bool>)
```
để non_blocking=True sẽ giúp việc đem dữ liệu từ CPU qua GPU một cách bất đồng bộ để model train nhanh hơn 
