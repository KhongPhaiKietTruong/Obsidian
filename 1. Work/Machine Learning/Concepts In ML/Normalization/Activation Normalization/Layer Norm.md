## Định Nghĩa 
Là một phương pháp [[Activation Normalization]] khá giống với [[Batch Norm]] (chuẩn hóa trên từng cột [[Features]]) thì layer norm chuẩn hóa trên từng mẫu riêng lẻ 
$$\text{LayerNorm}(x) = \frac{x - \mu}{\sqrt{\sigma^2 + \epsilon}} \odot \gamma + \beta$$
## Sử Dụng 
- được dùng trong [[Transformer]], LLM, [[RNN Layer]] 