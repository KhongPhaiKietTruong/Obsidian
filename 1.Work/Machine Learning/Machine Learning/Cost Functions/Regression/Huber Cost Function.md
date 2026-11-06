## Định Nghĩa
Huber Cost Function là trung bình cộng của các [[Huber Loss]]
$$J(\theta) = \frac{1}{N} \sum_{i=1}^N L_\delta(y_i, f(x_i; \theta))$$
## Đặc Điểm 
- hàm loss này giúp model ít nhạy cảm hơn so với [[Outliers]]
- là một [[Gradient Clipping]] tự nhiên 