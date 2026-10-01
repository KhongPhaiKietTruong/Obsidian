tên khác: Kaiming Initialization 

He initialization là một kĩ thuật khởi tạo tham số được sử dụng khi [[Neural Network (Mạng Neural)]] có hàm activation [[ReLU]] hoặc **biến thể** của nó, dùng để giảm tình trạng [[Vanishing Gradient]] hoặc [[Exploding Gradient]], nó giúp [[Activations|giá trị kích hoạt]] và [[Gradient]] khi lan truyền các [[Layer]] mà không bị giảm nhanh hoặc tăng theo cấp số mũ thay vào đó thì các giá trị kích hoạt vẫn giữ được sấp xỉ giá trị của nó dù đi qua nhiều [[Layer]]

He initialization có dạng như sau: 
$$
W \sim N\left( 0,  \frac{2}{n_{in}}  \right) 
$$
với:
- N là [[Normal Distribution (Gaussian distribution)]] 

triển khai trong code
```python
W[l] = np.random.randn(n_out, n_int) * np.sqrt(2 / n_in)
```

lí do mà ta nhân cho $\sqrt{ \frac{2}{n_{in}} }$ là do [[random.randn()]] tuân theo N(0, 1) nhưng ta cần là N(0, $\frac{2}{n_{in}}$) nên đây là cách để biến đổi 