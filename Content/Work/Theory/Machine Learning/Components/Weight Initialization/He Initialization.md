được sử dụng khi mạng neural có hàm activation [[ReLU]]
He initialization có dạng như sau:
$$
W \sim N\left( 0,  \frac{2}{n_{in}}  \right) 
$$
với:
- N là [[Normal distribution (Gaussian distribution)]]

triển khai trong code
```python
W = np.random.rand()
```