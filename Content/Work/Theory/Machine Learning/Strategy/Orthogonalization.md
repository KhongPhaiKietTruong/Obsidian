là một ý tưởng để điều chỉnh một model sao cho, với mỗi các phương pháp ta sử dụng lên model đó thì nó chỉ tác động mạnh đến một vấn đề đó, nghĩa là khi ta điều chỉnh một cái gì đó thì nó không nên tác động đến nhiều thứ.
ví dụ điển hình nhất là [[Early Stopping (Dừng Sớm)]], trong thực tế thường ít dùng vì nó khiến 

ví dụ khi model ta bị [[Underfitting - High Bias]] với:
- [[Training Error]] 30%
- [[Validation Error]] 34% 

phương pháp mà ta thực hiện để giải quyết vấn đề này sẽ là:
- sử dụng mạng neural lớn hơn (nhiều lớp hơn)
- 