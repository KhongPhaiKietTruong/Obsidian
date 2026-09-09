trong [[Gradient Descent]], đôi lúc ta đi từ điểm ban đầu đến [[[[Global Minimum (Cực Tiểu Toàn Cục)]]]] đường đi bị "lắc lư" và độ dài mỗi bước bé
đôi lúc thì đi gấp khúc với độ dài bước đi dài

adam sinh ra để tối ưu cho việc này, ở trường hợp đường đi lắc lư và độ dài bước bé, adam sẽ tăng giá trị update của trọng số w giúp cho bước đi của chúng ta dài hơn và "làm mượt" đường đi với trường hợp đường đi thẳng và bước lớn thì giảm bước lớn, vẫn duy trì độ ổn định đường đi  

adam là sự kết hợp giữa [[Momentum]] và [[RMSProp]] với các giá trị :

$$
v_t = \beta_1 v_{t-1} + (1-\beta_1)g_t
$$
- v chính là thành phần của momentum 

$$
s_t = \beta_2 s_{t-1} + (1-\beta_2)g_t^2
$$
- s chính là thành phần của RMSProp 
sau đó ta thực hiện [[Bias Correction]] cho v và s:
$$
\hat{v}_t = \frac{v_t}{1-\beta_1^t}
$$
$$
\hat{s}_t = \frac{s_t}{1-\beta_2^t}
$$
giá trị của $\beta_{1}$ thường là **0.9** và $\beta_{2}$ là **0.999**, $\epsilon$ thường là $10^-8$, đây cũng là giá trị mặc định sẵn, ta thường không đụng đến 

cuối cùng, ta thực hiện update:
$$
W_t = W_{t-1} - \alpha \frac{\hat{v}_t}{\sqrt{\hat{s}_t}+\epsilon}
$$
đây chính là công thức update của [[Weight (Trọng Số) w]] khi áp dụng cả momentum và RMSProp 

lí do mà adam cần bias correction trong khi 2 cái kia không cần là vì adam dùng tận hai cái EWA một lượt nên sai số sẽ x2 
adam gần như là lựa chọn mặc định trong các model