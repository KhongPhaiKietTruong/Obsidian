## Định Nghĩa 
RMSNorm là phiên bản cái tiến của [[Layer Norm]] khi loại bỏ việc tính [[Giá trị trung bình]] của các mẫu trong batch và bỏ luôn [[Bias]] 
$$\bar{x} = \frac{x}{\text{RMS}(x)} \odot \gamma$$
với:
$$\text{RMS}(x) = \sqrt{\frac{1}{d} \sum_{i=1}^d x_i^2 + \epsilon}$$
