# Ứng dụng của mã hóa
- IPSec (internet protocol security): bảo vệ tính bảo mật và tính toàn vẹn thông tin​	  
- PGP (Pretty good privacy): sử dụng mã hóa khóa công khai
- SSL (Secure Sockets Layerl): trao đổi dữ liệu một cách an toàn

# Các thuật ngữ
Plaintext (bản rõ): là thông điệp gốc
Secret key (khóa bí mật): là một giá trị để đưa vào thuật toán mã hóa
Ciphertext (bản mã): là thông điệp sau khi được mã hóa

# Phân loại mật mã
## dựa trên phép biến đổi
### phép thế
#### mã hóa Caesar:
là phép dịch chữ đi **k** vị trí trong bảng chữ cái, phép này dễ bị giải bằng vét cạn
mã hóa: c = (p+k) mod 26
giải mã: c = (p-k) mod 26
#### mã hóa đơn mẫu:
thay các ký tự gốc thành các kí tự ngẫu nhiên khác (a=j, b=l, c=, ....), dễ bị giải bằng phân tích tuần suất chữ cái
- phép hoán vị
## dựa trên số lượng khóa
- mã hóa đối xứng (1 khóa): 1 khóa cho cả mã hóa và giải mã
- mã hóa bất đối xứng (2 khóa): khóa công khai và khóa riêng tư
## dựa trên cách xử lí bản rõ
- mã hóa khối: theo từng khối
- mã hóa luồng: theo từng bit hoặc ký tự

# Các loại tấn công giải mã
- vét cạn
- thám mã
- tấn công dựa trên triển khai thực tế
- tấn công phi kĩ thuật

# Độ mạnh mật mã
​phụ thuộc vào **chi phí** và **thời gian** 

