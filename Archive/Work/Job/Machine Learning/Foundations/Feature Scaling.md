dịch: chuẩn hóa đặc trưng

vấn đề: lấy ví dụ với bài toán dự đoán giá nhà, ta xét 2 [[Features]] $lại$  là diện tích nhà và số phòng có miền giá trị như sau:
- $x_{1}$ $\in$ \[1000, 5000]
- $x_{2}$ $\in$ \[1, 5]

ta có [[Cost Function]] (giả sử ta dùng [[Mean Squared Error Cost Function (MSE)]]) là:
$$ 
J(\vec{w},b) = \frac{1}{2m} \sum_{i=1}^{m} \left( f_{\vec{w},b}(\vec{x}^{(i)}) - y^{(i)} \right)^2
$$
khi đó $w_{1}$ chỉ cần tăng nhẹ thôi cũng khiến hàm cost tăng vọt vì giá trị của $x_1$ lớn, $w_2$ tăng mạnh thì cost cũng chỉ tăng nhẹ do giá trị của $x_2$ nhỏ.
điều này khiến cho [[Contour Plot]] của hàm cost mỏng, dẹp và con đường đi để tìm [[Global Minimum]] của ta trên hàm cost bị "lắc lư" như này:


![[Pasted image 20260518100531.png|center]]

do đó ta phải chuẩn hóa miền giá trị của các đặc trưng lại

lưu ý: với mỗi đặc trưng ta sẽ có một chỉ số tỉ lệ riêng cho nó, điều này nghĩa là đồ thị biểu diễn [[Training Set]] sẽ thay đổi (trở nên đồng đều hơn sau scaling) chứ không phải hình dạng như cũ và chỉ bị "thu nhỏ thôi"

