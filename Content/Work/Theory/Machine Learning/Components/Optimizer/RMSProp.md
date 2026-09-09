RMSProp giúp kiểm soát độ lớn của mỗi bước di chuyển của từng tham số có thể học 

ở [[Momentum]], ta áp dụng [[Exponentially Weighted Average (EWA)]] lên [[Gradient]], còn ở RMSProp thì ta áp dụng EWA lên bình phương của gradient 

RMSProp giúp ta **kiểm soát độ lớn** của việc update [[Weight (Trọng Số) w]] thông qua [[Gradient Descent]] bằng công thức:
$$
S_{dW}^{(t)} = \beta S_{dW}^{(t-1)} + (1-\beta)(dW_t)^2
$$
và update bằng:
$$
W_t = W_{t-1} - \alpha \frac{dW_t}{\sqrt{S_{dW}^{(t)}} + \epsilon}
$$
với:
- $S_{dW}^{(t)}$ là EWA áp dụng lên gradient bình phương 
- $\epsilon$ là hệ số giúp cho chúng ta không bị chia cho 0 nếu như $\sqrt{ S_{dW}^{(t)} }$ gần như bằng 0, giá trị của $\epsilon$ thường là $10^-8$ 

lưu ý ở công thức update thì $dW_{t}$ vẫn giữ lại dấu của gradient, nghĩa là hướng không bị đổi, việc chia cho cái căn ở dưới giúp ta điều chỉnh độ lớn 

khi các gradient ở quá khứ lớn, nó sẽ giúp điều chỉnh lượng update của tham số ở hiện tại nhỏ lại và ngược lại, tức là nó sẽ hạn chế sự thay đổi quá đột ngột về lượng update