vấn đề: lấy ví dụ với bài toán dự đoán giá nhà, ta xét 2 [[Features (Đặc Trưng)]] là diện tích nhà và số phòng có miền giá trị như sau:
- $x_{1}$ $\in$ \[1000, 5000]
- $x_{2}$ $\in$ \[1, 5]
- 
[[Hypothesis (hàm dự đoán)]] của ta có dạng: $$f_{\vec{w}, b}(\vec{x}) = w_{1} x_{1} + w_{2}x_{2} + b$$ta có [[Cost Function (Hàm Chi Phí)]] (giả sử ta dùng [[Mean Squared Error Cost Function (MSE)]]) là:
$$ 
J(\vec{w},b) = \frac{1}{2m} \sum_{i=1}^{m} \left( f_{\vec{w},b}(\vec{x}^{(i)}) - y^{(i)} \right)^2
$$
khi đó $w_{1}$ chỉ cần tăng nhẹ thôi cũng khiến hàm dự đoán tăng vọt (đồng nghĩa với việc hàm cost cũng tăng vọt) vì giá trị của $x_1$ lớn, $w_2$ tăng mạnh thì cost cũng chỉ tăng nhẹ do giá trị của $x_2$ nhỏ.
điều này khiến cho [[Contour Plot]] của hàm cost mỏng, dẹp và con đường đi để tìm [[Global Minimum (Cực Tiểu Toàn Cục)]] của ta trên hàm cost bị "lắc lư" làm cho tốc độ hội tụ chậm chạp:


![[Pasted image 20260518100531.png|center]]

do đó ta phải chuẩn hóa miền giá trị của các đặc trưng lại (biến miền giá trị của x1 và x2 đều trở thành \[0, 1])

## 3 cách để chuẩn hóa là:
### chia các giá trị cho giá trị lớn nhất
​	​	giả sử miền giá trị của x1 là \[1000, 5000], ta thực hiện chia các giá trị đó cho giá trị lớn nhất, tức miền giá trị mới của x1 là \[1000/5000, 5000/5000] = \[0,2, 1]
### mean normalization
có công thức là $$X' = \frac{X - \mu}{X_{\max} - X_{\min}}$$
với $\mu$ là [[Mean value (Giá Trị Trung Bình)]] của feature X 

### z-score normalization 


lưu ý: với mỗi đặc trưng ta sẽ có một chỉ số tỉ lệ riêng cho nó, điều này nghĩa là đồ thị biểu diễn [[Training Set (Tập Huấn Luyện)]] sẽ thay đổi (trở nên đồng đều hơn sau scaling) chứ không phải hình dạng như cũ và chỉ bị "thu nhỏ thôi"

