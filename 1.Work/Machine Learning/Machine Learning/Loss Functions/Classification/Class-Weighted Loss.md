## Định Nghĩa 
Weighted Cross-Entropy Loss là phiên bản cải tiến của [[Cross-Entropy Loss]] và có thêm trọng số với mỗi lớp
công thức 
$$L_{\text{CWE}} = - w_c \cdot y_c \log(\hat{y}_c)$$
với trọng số của mỗi lớp có thể được tính bằng công thức trọng số nghịch đảo tần suất lớp:
$$w_c = \frac{N}{C \cdot N_c}$$
trong đó:
- N: tổng số mẫu
- C: số lượng lớp
- $N_c$: số lượng mẫu của lớp C

> [!NOTE] 
> Lớp càng có ít mẫu thì sẽ có trọng số càng cao 
