
$$
\operatorname{Attention}(Q,K,V)=\operatorname{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
$$
với mỗi lần tính công thức này là 1 head, multi-head attention là hành động tính công thức này nhiều lần thay vì chỉ một lần, lí do ta làm điều này là vì mỗi head ta tính sẽ thấy được những đặc trưng khác nhau của chuỗi 
![[Pasted image 20260921002601.png]]head 1: what
head 2: when
head 3: who
...

các head này có thể được tính song song với nhau 
$$
\operatorname{head}_i=\operatorname{Attention}(W_i^Q Q,W_i^K K,W_i^V V)
$$
$$
\operatorname{MultiHead}(Q,K,V)=\operatorname{concat}(\operatorname{head}_1,\operatorname{head}_2,\ldots,\operatorname{head}_h)W_O
$$
