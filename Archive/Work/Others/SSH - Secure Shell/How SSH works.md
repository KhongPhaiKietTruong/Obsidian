SSH là một giao thức dùng để kết nối giữa client và server

SSH tạo ra một cặp key là [[public key]] và [[private key]]

khi client muốn kết nối với server
server gửi cho client một đoạn mã được mã hóa bằng public key
client phải giải mã nó bằng cách sử dụng private key
sau khi giải mã, client gửi lại cho server kiểm tra, nếu kết quả đúng thì hai máy sẽ được kết nối với nhau