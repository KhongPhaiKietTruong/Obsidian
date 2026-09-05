được sử dụng khi mạng neural có hàm activation [[ReLU]] hoặc biến thể của nó, dùng để giảm tình trạng [[Vanishing-Exploding Gradient (Tiêu Biến Gradient)]] 
He initialization có dạng như sau:
$$
W \sim N\left( 0,  \frac{2}{n_{in}}  \right) 
$$
với:
- N là [[Normal distribution (Gaussian distribution)]]

triển khai trong code
```python
W[l] = np.random.rand(n_in, n_out) * np.sqrt(2 / n_in)
```