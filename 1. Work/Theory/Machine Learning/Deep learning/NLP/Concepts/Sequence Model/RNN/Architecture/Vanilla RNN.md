Viết tắt của: Recurrent Neural Network 
Dịch: mạng neural hồi quy 
## Định Nghĩa 
RNN là một mô hình cho phép ta xử lí dữ liệu tuần tự như văn bản, giọng nói, ...  
![[Pasted image 20260921153206.png]]
## Đặc Điểm 
- RNN sử dụng cùng một ma trận [[Weight]] W cho tất cả các time step 
- Mỗi một cell chứa một vector [[Activations In RNN (Hidden State)]] (RNN cell $\neq$ [[Neuron]])
- Sử dụng Backpropagation through time để training 
## Ưu Điểm 
một trong những đặc điểm quan trọng nhất của RNN là nó giữ được thông tin của những input ở trước, nó có "trí nhớ" đối với những phần tử nằm trước thông qua [[Activations In RNN (Hidden State)]] 
## Nhược Điểm 
- dễ bị [[Vanishing Gradient]] khi chuỗi có độ dài lớn (khó học long-term dependFencies)
- phải tính toán tuần tự (không thể tính toán song song như [[Transformer]])