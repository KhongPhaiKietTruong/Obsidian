SSH là một giao thức dùng để kết nối giữa client và server

SSH tạo ra một cặp key là [[public key]] và [[private key]]

khi client muốn kết nối với server
server gửi cho client một đoạn mã được mã hóa bằng public key
client phải giải mã nó bằng cách sử dụng private key
sau khi giải mã, client gửi lại cho server kiểm tra, nếu kết quả đúng thì hai máy sẽ được kết nối với nhau


hiểu trực quan:
client sẽ gửi ổ khóa (public key) của mình cho server giữ, khi client muốn kết nối với server, server sẽ lấy ổ khóa của client đó, để vào trong đó một đoạn mật mã, rồi gửi cho client, client sẽ phải dùng chìa khóa của mình (private key), mở ổ khóa đó, lấy được đoạn mật mã gửi cho server, server sẽ kiểm tra xem đoạn mật mã đó đúng không, nếu đúng thì cho vào