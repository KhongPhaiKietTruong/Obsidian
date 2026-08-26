dịch: hồi quy tuyến tính

đây là dạng mà ta cho rằng mối quan hệ giữa [[Features (Đặc Trưng)]] và [[Target variable]] sẽ là một mối quan hệ tuyến tính (đường thẳng, mặt phẳng, ...)
[[Predicted Value]] sẽ là các điểm nằm trên đường thẳng (mặt phẳng hoặc cao hơn nữa) bởi được định nghĩa bởi các tham số w và b, tức là [[Hypothesis (hàm dự đoán)]] của linear regression sẽ có dạng:

$$f_{\vec{w}, b}(\vec{x}) = \vec{w}^T \vec{x} + b$$
$$
\vec{x}= \begin{bmatrix}
x_{1}  \\
x_{2} \\
... \\
x_{n}
\end{bmatrix}
\text{ và }
\vec{w}= \begin{bmatrix}
w_{1}  \\
w_{2} \\
\dots \\

w_{n}
\end{bmatrix}
$$

$f_{\vec{w}, b}(\vec{x})$ là giá trị dự đoán của model 
lí do mà $\vec{x} \text{ và } \vec{w}$ là vector thay vì vector hàng là vì đó là quy ước chuẩn của đại số tuyến tính