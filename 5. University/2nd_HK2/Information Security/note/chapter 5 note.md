# kiến trúc AAA:
- xác thực (authen)
- cấp quyền (authorize)
- lưu lại các hoạt động (account)

False negative: thông tin đăng nhập sai nhưng hệ thống lại cấp quyền
False positve: thông tin đăng nhập đúng nhưng hệ thống không cấp quyền 

# CAS 

# xác thực dựa trên mật khẩu 
biện pháp cải thiện: 
- lưu trữ dạng băm kèm muối
- mật khẩu động: TOTP (time-based OPT) (dựa trên thời gian thực tế), HOTP (HMAC-based) (dựa trên giá trị băm của mật khẩu trước đó)
# xác thực dựa trên token
- thẻ vật lí
- thẻ thông minh
- CCCD 
# xác thực sinh trắc học
có tính duy nhất và cực kì khó sao chép
# xác thực đa yếu tố (MFA)
- yếu tố tri thức (thứ mà bạn biết)
- yếu tố sở hữu (thứ bạn có)
- yếu số sinh học (thứ tạo ra bạn)
# xác thực không mật khẩu
ví dụ như giao thứ PHAAT (phone as a token)
chuẩn FIDO/FIDO2 (Fast Idenity Online)

# mô hình zero trust
luôn luôn bắt phải xác thực