resize(src, dsize\[, dst\[, fx\[, fy\[, interpolation]]]]) -> dst

src: ảnh gốc
dsize: tuple (width, height) kích thước muốn resize thành
dst: hong can quan tam
fx: hệ số tỉ lệ chiều rộng
fy: hệ số tỉ lệ chiều cao
interpolation: phương pháp nội suy ra pixel ảnh mới
![[Pasted image 20260117204829.png]]

lưu ý: ta thường không sử dụng tham số dst nên khi muốn scale ảnh, hãy truyền đối số cho 3 cái còn lại theo dạng keyword