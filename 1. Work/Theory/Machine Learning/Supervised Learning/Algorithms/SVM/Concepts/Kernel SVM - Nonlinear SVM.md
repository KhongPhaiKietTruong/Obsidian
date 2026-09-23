## Định Nghĩa 
nó vẫn tương tự các ý tưởng cũ là để margin to nhất có thể, chỉ có điều là [[Decision Boundary]] và margin boundary sẽ là đường cong 

để có được đường cong đó thì SVM thì ta sẽ biến đổi không gian để trở thành một không gian nhiều chiều hơn, sao đó phân chia các class bằng [[Hyperplane (Siêu Phẳng)]] sau khi chia xong, ta map cái hyperplane đó về chiều không gian cũ thì hyperplane đó sẽ trở thành một đồ thị cong để phân chia các class 

trong quá trình này ta sẽ sử dụng **hàm chuyển đổi** ϕ(x) để map các điểm dữ liệu từ không gian cũ sang không gian mới 

## Kernel Trick 
giúp tính toán trong không gian nhiều chiều mà khong thật sự cần phải map các điểm dữ liệu sang chiều cao hơn, giúp [[SVM]] nhanh hơn 