để đảm bảo tiến trình truy cập đúng vùng nhớ của nó, hệ điều hành dùng một cặp thanh ghi là [[Base register (thanh ghi base)]] và [[Limit Register (thanh ghi limit)]] 

base <= address < base + limit

nếu điều kiện trên không thỏa, hệ điều hành sẽ bị gửi đến một tín hiệu [[Trap (exception)]] (lỗi định vị vị trí)