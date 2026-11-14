tên khác: Category Cross-entropy, Softmax loss  

## Định Nghĩa 
Cross-Entropy Loss được dùng trong dạng bài toán nhiều lớp với cơ chế: 
- Dự đoán **đúng** với độ **tự tin cao** cho [[Penalty]] **bé** (tức loss bé)
- Dự đoán **sai** với độ **tự tin cao** cho penalty **lớn** (tức loss lớn)
có công thức là: 
$$L = -\sum_{i=1}^C y_i \log(\hat{y}_i)$$với:
- C là số lớp 
- $\hat{y}_{i}$ là kết quả dự đoán (ở dạng xác suất)
- $y_{i}$ là đáp áp thực tế ở dạng [[One-hot Encoding]] 

> [!note]
> Log ở đây thường là ln

miền giá trị của hàm này là:
$$
Loss \in [0, +\infty)
$$
## Sử Dụng 
- [[1.Work/Machine Learning/Deep Learning/Computer Vision (CV)/Tasks In CV/Classification|Classification]] nhiều lớp 
- [[Image Segmentation]] 