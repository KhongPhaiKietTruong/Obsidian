viết tắt của: Gaussian Error Linear Unit 

## Định Nghĩa 
GELU là một hàm [[Activations]] có sự kết hợp giữa [[ReLU]] và [[Vanilla Drop Out]] 
$$\text{GELU}(x) = x \cdot P(X \le x) = x \cdot \Phi(x)$$
Trong đó $\Phi(x)$ là hàm phân phối tích lũy (Cumulative Distribution Function - CDF) của phân phối chuẩn tắc:
$$\Phi(x) = \frac{1}{2} \left[1 + \text{erf}\left(\frac{x}{\sqrt{2}}\right)\right]$$

## Đặc điểm
- smooth hơn [[ReLU]] 
- input là số dương thì gelu là [[Idenity Function]] còn input là âm càng bé thì giá trị output càng tiến về 0 (xấp xỉ)
## Ưu Điểm 
- Không bị [[Dying Relu]] 
## Sử Dụng 
- thường được sử dụng trong các [[Transformer Model]] hiện đại 