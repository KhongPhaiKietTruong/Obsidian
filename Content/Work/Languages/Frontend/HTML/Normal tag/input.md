dùng để tạo một ô nhập input vào
### Nhập văn bản & Số liệu
- `type="text"`: Ô nhập văn bản một dòng mặc định.
- `type="password"`: Ô nhập mật khẩu (ký tự tự động biến thành dấu chấm `•`).
- `type="email"`: Ô nhập email (tự động kiểm tra định dạng `@` khi submit).
- `type="number"`: Chỉ cho phép nhập số, có nút tăng/giảm.
- `type="search"`: Ô tìm kiếm (thường có nút `x` để xóa nhanh nội dung)
### Lựa chọn & Tương tác
- `type="checkbox"`: Hộp kiểm, cho phép chọn nhiều lựa chọn cùng lúc.
- `type="radio"`: Nút chọn một duy nhất trong một nhóm (các nút phải có cùng thuộc tính `name`).
- `type="range"`: Thanh trượt để chọn giá trị trong một khoảng (sử dụng thêm `min`, `max`, `step`).
- `type="file"`: Chọn và tải tệp tin từ thiết bị lên.
- `type="color"`: Hộp thoại chọn màu sắc.
### Ngày tháng & Thời gian
- `type="date"`: Chọn ngày/tháng/năm từ một lịch hiển thị sẵn.
- `type="time"`: Chọn giờ/phút.
### Các nút chức năng (Buttons)
- `type="submit"`: Nút để gửi toàn bộ dữ liệu trong `<form>` lên server.
- `type="button"`: Nút bấm thông thường, thường dùng để kích hoạt hàm JavaScript.
- `type="reset"`: Nút khôi phục lại giá trị ban đầu của tất cả các ô nhập liệu trong form.