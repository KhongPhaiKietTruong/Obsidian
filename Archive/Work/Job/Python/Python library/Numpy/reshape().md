là hàm dùng để thay đổi hình dạng của ma trận (số hàng, số cột)

lưu ý 1: hàm reshape chỉ trả về một view, nghĩa là thay đổi giá trị của ma trận được tạo bởi reshape sẽ thay đổi lên mảng gốc luôn

lưu ý 2: phải đảm bảo hình dạng mới có số phần tử bằng hình dạng cũ
nghĩa là tích của hàng mới và cột mới bằng tích của hàng cũ và cột cũ

![[Pasted image 20260112020607.png]]

hàm này còn có chức năng tự động tính số hàng/cột còn lại bằng cách dùng số -1
ví dụ cho mảng 1 chiều 12 phần tử, biến nó thành mảng 2 chiều gồm 3 hàng, 4 cột, thay vì ngồi tính và nhập được số 4 thì ta nhập -1 để np tính dùm
![[Pasted image 20260112020743.png]]