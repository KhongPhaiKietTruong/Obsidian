## Định Nghĩa 
Weighted Cross-Entropy Loss là phiên bản cải tiến của [[Cross-Entropy Loss]] và có thêm trọng số với mỗi lớp 
$$L_{\text{WCE}} = - \sum_{c=1}^C w_c \cdot y_c \log(\hat{y}_c)$$
với trọng số của mỗi có thể được tính bằng công thức:
$$w_c = \frac{N}{C \cdot N_c}$$
