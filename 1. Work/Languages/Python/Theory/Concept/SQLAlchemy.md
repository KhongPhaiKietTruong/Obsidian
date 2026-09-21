là một thư viện giúp chuyển database, [[Table (Bảng)]] thành các [[Class (Lớp)]] trong python để ta có thể dễ dàng làm việc với database đó mà không cần viết các câu truy vấn sql phức tạp 
ví dụ
```
# cach truyen thong
SELECT * FROM users;

# su dung SQLAlchemy
users = db.query(User).all()
```