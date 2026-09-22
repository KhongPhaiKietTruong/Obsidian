## Định Nghĩa
dropout regularization giúp ta giảm [[Overfitting - High Variance]] ngăn ngừa hiện tượng [[Neural Network]] phụ thuộc nhiều vào một số [[Neuron]] nhất định bằng cách tắt ngẫu nhiên mỗi lần đưa mẫu vào, giúp các neural học đa dạng hơn

với mỗi [[Layer]], ta sẽ thực hiện bỏ đi $(1-\text{keep\_prob})*100\%$ đi số [[Neuron]] mỗi lớp, nghĩa là xét mỗi neural, có $(\text{keep\_prob})*100\%$  ta sẽ giữ neural đó lại và $(1-\text{keep\_prob})*100\%$ ta sẽ bỏ neural đó đi

## 
dropout **không** được sử dụng ở **mọi** lớp, nhất là lớp output
và ma trận mask sẽ được khởi tạo lại (ngẫu nhiên) mỗi sample / mini-batch được truyền vào

giả sử mạng neural ta có thực hiện dropout với prob_keep = 25% thì mỗi layer cho ra 0.75A và dựa trên những layer cho ra ~0.75A đó mà [[Weight]] ta học được cũng tương ứng theo giá trị layer đó, khi ta thực hiện [[Inference - Test time]] thì sẽ không có thành phần dropout thì mỗi layer cho ra A, điều này dẫn đến ta áp dụng các trọng số học được từ 0.75A lên A (từ lớp trước truyền đến) gây ra sự **không khớp** khiến mô hình dự đoán rất tệ 