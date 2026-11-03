## Định Nghĩa
vanilla RNN encoder thực hiện chuyển chuỗi input thành [[Embeddings]] bằng cách truyền [[Activations In RNN (Hidden State)]] của time step trước và từ ở vị trí hiện tại vào làm input cho [[Vanilla RNN Cell]], embedding của chuỗi input sẽ là vector hidden state cuối cùng ![[Pasted image 20260920140135.png]]
## Nhược Điểm 
nhược điểm lớn nhất của [[Encoder]] này là [[Vanishing Gradient]] 