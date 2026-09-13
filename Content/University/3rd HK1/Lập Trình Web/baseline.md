hệ thống gợi ý: 
database sẽ host lên azure 
hệ thống gợi ý: content-based (dựa trên thao tác của người dùng) 

chuyển các sản phẩm thành vector, dựa trên thao tác với n sản phẩm gần nhất rồi tính ra được vector thể hiện mối yêu thích của user
ví dụ:
click sp A: 3 điểm
thêm sp B vào vỏ: 4 điểm
mua sp C: 5 điểm 

vector đại diện cho xu hướng mua hàng của user là:
$$
\vec{v}=\frac{3a​+4b+5c}{3}
$$
xong timfwebservlet gọi đến api của hệ thống gợi ý để biết đem nào phẩm nào để hiện lên 