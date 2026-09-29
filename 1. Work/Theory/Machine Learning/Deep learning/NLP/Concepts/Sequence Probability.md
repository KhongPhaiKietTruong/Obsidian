để tính được xác suất của một chuỗi, ta sẽ áp dụng [[Conditional Probability - Bayes's Rule]]
và Chain Rule 


$$P('Truong Anh Kiet Dep Trai') = P(Anh|Truong)P(Kiet|Truong Anh)P(Dep|Truong Anh Kiet)P(Trai|Truong Anh Kiet Dep)$$

nhưng khi tính với cách này thì ta sẽ cần rất nhiều chi phí + việc câu dài sẽ khiến xác suất ngày càng nhỏ và bằng 0, do đó ta sẽ chỉ thực hiện tính xấp xỉ bằng [[N-gram]] (chỉ xét n từ cuối)

giả sử với trigram
$$
P('TruongAnhKietDepTrai') \approx P(Trai|KietDep)
$$
công thức tổng quát:
$$
P(w_1^n) \approx \prod_{i=1}^{n} P(w_i \mid w_{i-1})
$$
