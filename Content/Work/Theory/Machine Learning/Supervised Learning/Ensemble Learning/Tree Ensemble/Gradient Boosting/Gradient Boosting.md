là một phương pháp để xây dựng nên một model mạnh bằng cách kết hợp nhiều [[Weak Learner]] lại với nhau, với mỗi cây sau sẽ cố gắng sửa chữa lỗi của cây trước 
$$
F_M(x) = F_0(x) + \eta h_1(x) + \eta h_2(x) + \cdots + \eta h_M(x)
$$
