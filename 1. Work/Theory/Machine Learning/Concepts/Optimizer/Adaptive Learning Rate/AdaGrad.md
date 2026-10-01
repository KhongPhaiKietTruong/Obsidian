## Định Nghĩa 
AdaGrad là một [[Optimizer]] có sử dụng kĩ thuật [[Adaptive Learning Rate]], nó tích lũy bình phương [[Gradient]] trong quá khứ 
$$G_t = G_{t-1} + \nabla_t^2$$ $$\theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{G_t + \epsilon}} \odot g_t$$
với: 
- $\theta$: [[Learnable Parameters (Tham Số Có Thể Học)]] 
- $g_{t}$: [[Gradient]] 