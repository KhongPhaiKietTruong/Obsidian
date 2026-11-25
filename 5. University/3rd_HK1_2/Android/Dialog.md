Dialog là một cửa sổ nhỏ đè lên [[Activity]] hiện tại 

ý nghĩa của 3 folder cốt lõi:
- folder data/model
- folder data/repository
- folder data/ui

tại sao class order tận 3 cái constructor ?

## Tài Khoản
User.java: khai báo class người dùng
AuthViewModel.java:
AuthRepository.java: xử lí FirebaseAuth (login bằng Google acc) hoặc CRUD bảng user để tạo tk, đăng nhập 

## Giỏ Hàng 
CartItem.java: class đại diện cho một món hàng trong giỏ hàng
CartViewModel: 
CartRepository.java: 

## Đơn Hàng 
Order.java đại diện cho một đơn hàng 
OrderRepository.java:  
OrderViewModel.java: 
OrderDetailActivity.java 