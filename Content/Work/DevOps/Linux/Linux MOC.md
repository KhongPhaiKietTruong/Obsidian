# Linux MOC (Map of Content)

Chào mừng bạn đến với tài liệu hướng dẫn học và tra cứu Linux. Dưới đây là mục lục liên kết đến các phần nội dung chi tiết:

## 1. Cấu trúc thư mục hệ thống (Linux Directory Structure)
- [[Content/Work/DevOps/Linux/Linux system file/bin|bin]] - Thư mục chứa các chương trình thực thi hệ thống cho tất cả người dùng (hiện tại là symbolic link đến `/usr/bin`)
- [[Content/Work/DevOps/Linux/Linux system file/sbin|sbin]] - Thư mục chứa các file thực thi hệ thống dành riêng cho quản trị viên (root)
- [[Content/Work/DevOps/Linux/Linux system file/lib|lib]] - Chứa các module/thư viện chia sẻ chung được sử dụng bởi `/bin` và `/sbin`
- [[Content/Work/DevOps/Linux/Linux system file/etc|etc]] - Chứa các file văn bản cấu hình hệ thống
- [[Content/Work/DevOps/Linux/Linux system file/usr/bin|usr/bin]] - Nơi chứa các package được cài đặt thông qua trình quản lý gói pacman
- [[Content/Work/DevOps/Linux/Linux system file/opt|opt]] - Thư mục chứa các phần mềm/tài liệu của bên thứ ba tải về (không qua package manager)
- [[Content/Work/DevOps/Linux/Linux system file/local share|local share]] - Chứa dữ liệu chia sẻ của các ứng dụng cục bộ
- [[Content/Work/DevOps/Linux/Linux system file/dot cache|dot cache]] - Chứa dữ liệu đệm (cache) của các phần mềm, có thể xóa an toàn để giải phóng dung lượng

## 2. Quản lý gói trên Arch Linux (Arch Linux & Pacman)
- [[Content/Work/DevOps/Linux/Arch (btw)/package manager|package manager]] - Khái niệm về trình quản lý gói của hệ điều hành và ngôn ngữ lập trình
- **Các thao tác với Pacman & Yay:**
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Install a package|Install a package]] - Cài đặt gói mới (`pacman -S`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Remove a package (with config and dependency)|Remove a package (with config and dependency)]] - Xóa gói kèm theo file cấu hình và các gói phụ thuộc không dùng đến (`pacman -Rns`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Update system|Update system]] - Cập nhật toàn bộ hệ thống (`pacman -Syu` hoặc `yay -Syu`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/See installed package|See installed package]] - Xem danh sách các gói đã cài đặt trên hệ thống (`pacman -Q`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Find package local|Find package local]] - Tìm kiếm gói đã cài đặt cục bộ trên máy (`pacman -Qs`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Find package remote|Find package remote]] - Tìm kiếm gói trên kho lưu trữ trực tuyến (`pacman -Ss`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Remove cache (safe)|Remove cache (safe)]] - Xóa cache của các package không còn trên máy (`paccache -r`)
  - [[Content/Work/DevOps/Linux/Arch (btw)/Pacman/Remove orphan|Remove orphan]] - Xóa các package mồ côi không còn cần thiết (`yay -Yc`)

## 3. Công cụ & Tiện ích (Tools & Utilities)
- [[dev-null|dev-null]] - File `/dev/null` đóng vai trò là thùng rác của Linux, dữ liệu truyền vào đây sẽ biến mất
- [[Content/Work/DevOps/Linux/Tools/ncdu|ncdu]] - Công cụ phân tích dung lượng ổ đĩa của các thư mục tại đường dẫn hiện tại
- **Quản lý Snapshot (Snapper):**
  - [[Content/Work/DevOps/Linux/Tools/Snapper/Chụp snapshot|Chụp snapshot]] - Tạo bản snapshot hệ thống bằng snapper (bản lưu trữ hoặc bản tự động xóa)
  - [[Content/Work/DevOps/Linux/Tools/Snapper/Rollback về bản cũ|Rollback về bản cũ]] - Khôi phục hệ thống về bản snapshot trước đó qua Limine hoặc snapper rollback

## 4. Công thức Terminal (Terminal Recipes)
- [[Content/Work/DevOps/Linux/Terminal Recipe/nohup|nohup]] - Công cụ chạy ngầm tiến trình giúp tiến trình không bị tắt khi terminal đóng
- [[Content/Work/DevOps/Linux/Terminal Recipe/khởi động phần mềm không chiếm terminal|khởi động phần mềm không chiếm terminal]] - Chạy ứng dụng dưới nền và chuyển hướng đầu ra để giải phóng hoàn toàn terminal
