# setfacl 
setfacl (set file access control list)
setfacl -m (modify)
setfacl -x (remove)
cú pháp: setfacl -m \<object>: \<obj_name>:\<permission> \<file_name/folder_name> 
setfacl -m u:jack:rw tailieu.txt
getfacl (lấy thông tin file access control list)

phân quyền dựa trên số:
chữ số 1: đặt getuid, setgid và sticky bit
ví dụ giá trị 4: nhị phân là 100 nghĩa là getuid on, setgid và sticky bit off
setuid: chạy một file với quyền của owner
getgid: tương tự setuid nhưng là của group
sticky bit: chỉ có ownser mới có quyền xóa hoặc đổi tên file

3 chữ số còn lại: đặt quyền cho user, group và other 
1: thực thi, 2: ghi, 3: đọc
giá trị 7: gồm cả 3 quyền
giá trị 4: đọc và thực thi
giá trị 2: ghi

# chmod 
![[Pasted image 20260709095812.png]]
![[Pasted image 20260709100113.png]]
flag: -R (đổi luôn quyền cho các thư mục con)
đối tượng: u: user, g: group, a: tất cả
ví dụ: chmod +x tool.fish (đối tượng bỏ trống là tất cả)