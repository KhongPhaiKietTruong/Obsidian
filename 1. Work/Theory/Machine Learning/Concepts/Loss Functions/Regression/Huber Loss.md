là sự kết hợp của [[AE Loss (Absolute Error)]] và [[SE Loss (Squared Error)]]
nếu [[The Error]] nhỏ thì dùng SE, độ lệch lớn thì dùng AE (phân biệt nhỏ lớn bằng một threshold )
$$
L_{\delta}(y,\hat{y})=\begin{cases}\frac{1}{2}(y-\hat{y})^2,& |y-\hat{y}|\le\delta\\ \delta\left(|y-\hat{y}|-\frac{1}{2}\delta\right),& |y-\hat{y}|>\delta\end{cases}
$$
hàm loss này giúp model ít nhạy cảm hơn so với outliers 