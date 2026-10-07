kí hiệu: $\alpha$ hoặc $\eta$ 
## Định Nghĩa 
là một [[Hyperparameter (Siêu Tham Số)]] quy định độ lớn của bước nhảy khi thực hiện cập nhật các tham số trong [[Neural Network]]
nếu ta không dùng [[Learning Rate Scheduler]] thì effective lr cũng chính là [[Base Learning Rate]]
nếu có sử dụng [[Adaptive Learning Rate]] thì mỗi một [[Learnable Parameters (Tham Số Có Thể Học)]] sẽ có effective learning rate riêng 

các giá trị base learning rate có thể thử: 0.001 -> 0.003 -> 0.01 -> 0.03 -> 0.1 -> 0.3 -> 1

để chọn được learning rate tốt thì thử qua các learning rate khác nhau, tìm lr mà lớn (khiến learning curve tăng dần / gấp khúc), tìm lr mà nhỏ (learning curve giảm nhưng chậm)
sau đó ta có thể lấy lr tốt bằng cách lấy cái lr lớn nhất mà bé hơn cái lr lớn (khiến lc tăng dần/gấp khúc) mà learning curve sẽ có xu hướng giảm 

![[Pasted image 20260826101337.png]]