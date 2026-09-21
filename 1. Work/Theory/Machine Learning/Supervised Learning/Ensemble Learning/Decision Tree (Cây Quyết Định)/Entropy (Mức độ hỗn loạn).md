đây là một đại lượng dùng để xem mức độ "không tinh khiết" của một tập dữ liệu
ví dụ: ta đặt p là tỉ lệ mẫu là mèo trong một tập mẫu thì entropy của tập đó là H(p)
giá trị của entropy nằm trong khoảng \[0, 1]
nếu tập mẫu có 6 con vật và cả 6 đều là mèo thì H(p)=0 (hoàn toàn tinh khiết)
nếu tập mẫu có 6 con vật và cả 6 đều không phải là mèo thì H(p)=0
nếu tập mẫu có 6 con vật và 3 con là mèo thì H(p)=1 (hỗn loạn)

công thức tính entropy là:
$$
H(p) = -p\log_2(p) - (1-p)\log_2(1-p)
$$
lí do mà ta lấy log cơ số hai là để giá trị lớn nhất của entropy sẽ là 1 