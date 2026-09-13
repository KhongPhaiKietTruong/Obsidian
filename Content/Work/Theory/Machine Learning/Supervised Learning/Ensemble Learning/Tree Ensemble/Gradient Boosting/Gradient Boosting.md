là một phương pháp để xây dựng nên một model mạnh bằng cách kết hợp nhiều [[Weak Learner]] lại với nhau, với mỗi cây sau sẽ cố gắng sửa chữa lỗi của cây trước 
$$
F_{i+1}(x) = F_i(x) + \eta h_{i+1}(x) 
$$
với:
- $F_{i}(x)$ là model hiện tại 
- $h_{{i+1}}(x)$ là c 
- 
tổng quát: 
$$
F_M(x) = F_0(x) + \eta h_1(x) + \eta h_2(x) + \cdots + \eta h_M(x)
$$
với:
- F là $F_{0}$ là model hiện tại 
- 