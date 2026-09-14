là một ý tưởng để điều chỉnh một [[Neural Network (Mạng Neural)]] sao cho, với mỗi các phương pháp ta sử dụng lên model đó thì nó chỉ tác động mạnh đến một vấn đề đó, nghĩa là khi ta điều chỉnh một cái gì đó thì nó không nên tác động đến nhiều thứ.
ví dụ điển hình nhất là [[Early Stopping (Dừng Sớm)]], trong thực tế thường ít dùng vì khi ta dừng việc huấn luyện sớm, nó tác động đến cả hai mục tiêu là: [[Regularization (Chuẩn Hóa)]] và [[Optimizer]] 

ví dụ khi model ta bị [[Underfitting - High Bias]] với:
- [[Train Error]] 30%
- [[Val Error - Dev Error]] 34% 

đầu tiên, ta sẽ cố điều chỉnh training error, phương pháp mà ta thực hiện để giải quyết vấn đề này sẽ là:
- sử dụng mạng neural lớn hơn (nhiều lớp hơn)
- train với nhiều epoch hơn 
- sử dụng optimizer tốt hơn 

và những phương pháp này thường chỉ tác động đến training error và tác động ít đến val error 
sau đó ta tiếp tục "chỉnh" val error 