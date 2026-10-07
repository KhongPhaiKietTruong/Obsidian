## Định Nghĩa 
Cross-Entropy Cost Function là trung bình cộng của các [[Cross-Entropy Loss]] có công thức là :
$$J = -\frac{1}{N} \sum_{i=1}^N \sum_{c=1}^C y_{i, c} \log(\hat{y}_{i, c})$$
với: 
- N là số lượng mẫu 
- C là số lượng lớp 
- y là [[Ground Truth]]
- $\hat{y}$ là xác suất dự đoán 