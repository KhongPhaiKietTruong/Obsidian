GLU là một [[MLP (FFN)]] áp dụng cơ chế gating để kiểm soát lượng thông tin được truyền qua 

GLU xử lí thông tin được truyền qua với hai nhánh song song:
- Gate Branch: quyết định thông tin nào được truyền qua 
- Value Branch: chứa thông tin cần truyền qua 
sau đó nhân hai nhánh này lại với nhau 

công thức:
$$ \boxed{GLU(x) = (xW_1 + b_1) \odot \sigma(xW_2 + b_2)}$$
Trong đó:
​- $xW_1 + b_1$: Value branch
​-	$xW_2 + b_2$: Gate branch
​-	$\sigma$: Sigmoid
​-	$\odot$: phép nhân từng phần tử 