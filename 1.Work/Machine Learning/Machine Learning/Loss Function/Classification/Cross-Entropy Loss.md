tên khác: Category Cross-entropy, Softmax loss  

## Định Nghĩa 
Cross-Entropy Loss được dùng trong dạng bài toán nhiều lớp với cơ chế: 
- Dự đoán **đúng** với độ **tự tin cao** cho [[Penalty]] **bé** (tức giá trị [[Loss Function]] bé)
- Dự đoán **sai** với độ **tự tin cao** cho penalty **lớn** (tức loss lớn)
có công thức là: 
$$L = -\sum_{i=1}^C y_i \log(\hat{y}_i)$$với:
- C là số lớp 
- $\hat{y}_{i}$ là kết quả dự đoán (ở dạng vector phân phối xác suất)
- $y_{i}$ là đáp áp thực tế ở dạng [[One-hot Encoding]] 

> [!note]
> Log ở đây thường là ln

miền giá trị của hàm này là:
$$
Loss \in [0, +\infty)
$$
## Sử Dụng 
- [[Image Classification|Image Classification]] nhiều lớp 
- [[Image Segmentation]]: thực hiện trên mỗi pixel, giả sử với ảnh (1, 3, 224, 224) thì mỗi pixel chính là một vector phân phối xác xuất (1, C, 1, 1)