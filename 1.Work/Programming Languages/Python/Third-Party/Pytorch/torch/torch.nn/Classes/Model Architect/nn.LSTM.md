dùng để định nghĩa một [[RNN]] có [[LSTM Cell]] 
```python
nn.LSTM(input_size, hidden_size, num_layers, ...)
```
với:
- input_size là số chiều của [[Vector]] input 
- hidden_size là số chiều của [[Activations In RNN (Hidden State)]] 
- là số lượng lớp LSTM xếp chồng lên nhau (giá trị > 1 tạo thành [[Deep RNN]])

lớp này nhận vào một [[Tensor]] có hình dạng: (B, T, N) và trả về 2 giá trị là rnn_out và tuple ($h_{n}$, $c_{n}$) với 
với:
- B là số lượng batch 
- T là số lượng time step 
- N là số chiều của vector đặc trưng 
- rnn_out là tensor chứa các hidden state tại mỗi time step của layer cuối cùng trong deep RNN 
- $h_{n}$ là hidden state và $c_{n}$ là cell state (xem thêm ở [[LSTM Cell]]) 


> [!NOTE] 
> rnn_out có hình dạng (B, T, D * hidden_size) 
> với:
> - B: kích thước batch 
> - T: số lượng time step 
> - D là số hướng (bidirectional=True/False) 
> - D\*hidden_size: số chiều của vector hidden state 
