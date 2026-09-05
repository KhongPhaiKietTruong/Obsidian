dropout regularization giúp ta giảm [[Overfitting - High Variance]] ngăn ngừa hiện tượng [[Neural Network (Mạng Neural)]] phụ thuộc nhiều vào một số [[Neural]] nhất định bằng cách tắt ngẫu nhiên mỗi lần đưa mẫu vào, giúp các neural học đa dạng hơn

với mỗi [[Layer (Lớp)]], ta sẽ thực hiện bỏ đi $(1-\text{keep\_prob})*100\%$ đi số [[Neural]] mỗi lớp, nghĩa là xét mỗi neural, có $(\text{keep\_prob})*100\%$  ta sẽ giữ neural đó lại và $(1-\text{keep\_prob})*100\%$ ta sẽ bỏ neural đó đi

giả sử ta đang xét ở layer l 
đầu tiên ta tính ma trận mask:
```python
d = np.random.rand(*a.shape) < keep_prob 
#output: d = [1, 1, 0, 1, 0, 1, 1, 1, 1, 1] (giả sử shape của a là (1, 10))
```

sau đó ta thực hiện "tắt" những neural bị chọn bằng cách nhân giá trị của [[Activation Function (Hàm Kích Hoạt)]] của chúng nó cho 0 
```python
a_new = np.multiply(a_old, d)
```

sau đó ta chia a_new cho keep_prob
```python
a_new = a_new / keep_prob 
```

dropout không được sử dụng ở **mọi** lớp, nhất là lớp output
và ma trận mask sẽ được khởi tạo lại (ngẫu nhiên) mỗi sample / mini-batch được truyền vào

giả sử mạng neural ta có thực hiện dropout nhưng không tăng 25% thì mỗi layer cho ra 0.75A và dựa trên những layer cho ra ~0.75A đó mà [[Weight (Trọng Số)]] ta học được cũng tương ứng theo giá trị layer đó, khi ta thực hiện [[Inference]] thì sẽ không có thành phần dropout thì mỗi layer cho ra A, điều này dẫn đến ta áp dụng các trọng số học được từ 0.75A lên A (từ lớp trước truyền đến) gây ra sự **không khớp** khiến mô hình dự đoán rất tệ 