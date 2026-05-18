dịch: đường ranh giới

đây là đường thẳng (hoặc mặt phẳng và cao hơn) , để phân tách giữa hai cụm 0 và 1, các điểm trên đường này có giá trị của [[Hypothesis]] là 0.5 tức là xác suất để nó có nhãn 1 là 0.5

đường thẳng này được tạo ra khi giải phương trình 
$$
\begin{align}
f_{\vec{w}, b}(\vec{x}) &= \frac{1}{1+e^{-(\vec{w}\vec{x}+b)}}=0.5 \\  \\
&\dots\\
&= \vec{w}\vec{x}+b=0
\end{align} 
$$
những điểm nằm trên đường ranh giới sẽ có xác suất nhãn 1 là 0.5, vậy những điểm nằm ở một phí thì sẽ có xác xuất lớn hơn 0.5 và tương tự vậy với các điểm ở phía còn sẽ bé hơn 0.5, tức
$$\vec{w}\vec{x}+b>0 \implies f_{\vec{w}, b}(\vec{x})>0.5$$