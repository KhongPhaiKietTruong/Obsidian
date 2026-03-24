Là cơ chế nằm trong [[Dynamic linking]], nó là một code nhỏ dùng để xác định vị trí của một chương trình thực sự

ví dụ khi ta dùng lệnh printf, chương trình sẽ nhảy vào stub, stub là đoạn code giúp xác định vị trí thật sự của chương trình câu lệnh printf, khi tìm thấy thì stub thay thế chính nó bởi chương trình đã tìm thấy
(stub chỉ được thực hiện ở lần đầu, sau khi được nạp rồi thì ở lần sau chương trình dùng trực tiếp)