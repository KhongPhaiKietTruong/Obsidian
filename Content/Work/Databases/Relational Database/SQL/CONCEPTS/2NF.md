nếu table dùng composite key, thì một giá trị không thể được suy ra từ một phần của composite key
ví dụ
một table có composite key là (masv, mamon) và các cột như tên sinh viên, ngày sinh, ...
thì ta thấy rằng, chỉ cần mã sinh viên thôi là ta đã suy ra được tên sinh viên mà không cần đến mamon, như vậy là không đạt 2NF
