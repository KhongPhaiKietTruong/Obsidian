## Định Nghĩa 
Weight Decay là một phương pháp mà ta thực hiện giảm tham số đi một tí ở mỗi bước 
$$\theta_{t+1} = (1 - \alpha\lambda)\theta_t$$
với: 
- $\theta$ là [[Learnable Parameters]] 
- $\alpha$ là [[Base Learning Rate]] 
- $\lambda$ là [[Weight Decay Factor]] 
