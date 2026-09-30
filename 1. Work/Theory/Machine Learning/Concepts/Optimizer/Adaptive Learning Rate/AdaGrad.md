## Định Nghĩa 
AdaGrad là một phương pháp mà nó tích lũy bình phương [[Gradient]] trong quá khứ 
$$G_t = G_{t-1} + \nabla_t^2$$ $$\theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{G_t + \epsilon}} \odot g_t$$