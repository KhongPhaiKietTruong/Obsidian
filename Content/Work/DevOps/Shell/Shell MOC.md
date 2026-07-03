# Shell MOC (Map of Content)

Chào mừng bạn đến với tài liệu hướng dẫn học và tra cứu Shell/Bash. Dưới đây là mục lục liên kết đến các phần nội dung chi tiết:

## 1. Toán tử & Chuyển hướng (Operators & Redirects)
- [[&|&]] - Chạy cùng lúc hai lệnh (chạy ngầm/background)
- [[&&|&&]] - Chạy lần lượt từng lệnh (lệnh sau chỉ chạy nếu lệnh trước thành công)
- [[>|>]] - Toán tử chuyển hướng: ghi đè nội dung vào file (nếu file đã tồn tại thì nó xóa hết và ghi đè lên tất cả)
- [[>>|>>]] - Toán tử nối: dùng để ghi thêm vào một file
- [[2_|2>]] - Dùng để ghi log lỗi (stderr) vào một file

## 2. Quản lý File & Thư mục (File & Directory Management)
- [[pwd|pwd]] - Hiển thị thư mục hiện tại (tùy chọn `-P` in đường dẫn vật lý, `-L` in đường dẫn logic)
- [[ls|ls]] - Liệt kê các file và thư mục với nhiều tùy chọn (`-l`, `-a`, `-h`, `-t`, `-r`, `-R`, `-S`, `-1`, `-d`, `-F`, `-i`)
- [[mkdir|mkdir]] - Tạo folder mới (tùy chọn `-p` tạo folder lồng nhau nhanh)
- [[touch|touch]] - Tạo một file mới nếu nó chưa tồn tại
- [[cp|cp]] - Tạo bản sao của một file hoặc folder (muốn copy folder phải dùng tùy chọn `-r`)
- [[rm|rm]] - Xóa một file hoặc folder
- [[alias|alias]] - Dùng để tạo shortcut (biệt danh) cho lệnh, quản lý hoặc hủy một alias (`unalias`)

## 3. Xem & Xử lý văn bản (Text Viewing & Processing)
- [[cat|cat]] - Dùng để xem toàn bộ nội dung của một file
- [[Content/Work/DevOps/Shell/Commands/head|head]] - Xem phần đầu file (tùy chọn `-n` chỉ định số dòng)
- [[tail|tail]] - Xem phần cuối file (tùy chọn `-n` chỉ định số dòng)
- [[grep|grep]] - Dùng để tìm kiếm trong một file
- [[awk|awk]] - Làm việc với file có ký tự ngăn cách

## 4. Tương tác & Trợ giúp (Interaction & Help)
- [[read|read]] - Dùng để đọc dữ liệu vào một biến từ bàn phím
- [[man|man]] - Xem hướng dẫn sử dụng chi tiết của một lệnh

## 5. Mạng & Tải dữ liệu (Networking & Data Transfer)
- [[ping|ping]] - Kiểm tra khả năng kết nối của máy tính với một máy chủ khác
- [[curl|curl]] - Truyền dữ liệu giữa máy tính với máy chủ (như một trình duyệt web không giao diện)
- [[wget|wget]] - Dùng để tải file từ website

## 6. Trình giả lập Terminal (Terminal Emulator)
### Kitty
- [[tạo tab mới|tạo tab mới]] - Phím tắt `ctrl shift t`
- [[đóng tab|đóng tab]] - Phím tắt `ctrl shift w`
- [[chuyển tab|chuyển tab]] - Phím tắt `ctrl shift + <- / ->`
- [[Đặt tên tab|Đặt tên tab]] - Phím tắt `ctrl shift alt t`
