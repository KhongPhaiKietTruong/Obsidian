tên khác: Cross-entropy, Softmax loss  

hàm loss này được dùng trong dạng bài phân loại nhiều nhãn 
có công thức là: 
$$

$$
với:
- $a_{j}$ là kết quả dự đoán 
- $y_{j}$ là đáp áp thực tế  

> [!note]
> Log ở đây thường là ln

miền giá trị của hàm này là:
$$
Loss \in [0, +\infty)
$$
dự đoán đúng với độ tự tin cao cho [[Penalty]] bé
dự đoán sai với độ tự tin cao cho penalty lớn