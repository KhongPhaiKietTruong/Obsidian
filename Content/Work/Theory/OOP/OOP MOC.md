# Object-Oriented Programming (OOP) MOC

Chào mừng bạn đến với Bản đồ nội dung (MOC) về **Lập trình hướng đối tượng (OOP)**. Đây là nơi lưu trữ và điều hướng toàn bộ các kiến thức cốt lõi, khái niệm cơ bản, và các tính chất quan trọng của OOP trong thư mục này.

---

## 🏗️ 1. Khái niệm cơ bản (Theory)
Các thành phần cơ bản cấu tạo nên một hệ thống lập trình hướng đối tượng:
- **[[Class (Lớp)]]** & **[[Object (Đối tượng)]]**: Hai khái niệm nền tảng nhất của OOP.
- **[[Constructor (Hàm khởi tạo)]]**: Hàm đặc biệt dùng để khởi tạo đối tượng từ class.
- **[[Attribute (Thuộc tính)]]**: Các đặc điểm, trạng thái lưu giữ thông tin của đối tượng.
- **[[Method (Phương thức)]]**: Các hành vi, hành động mà đối tượng có thể thực hiện.
- **[[Getter]] & [[Setter]]**: Các phương thức trung gian để truy xuất và thiết lập giá trị cho thuộc tính của đối tượng.

---

## 🌟 2. 4 Tính chất cốt lõi (The 4 Pillars of OOP)
Bốn cột trụ chính của OOP định hình cách thiết kế hệ thống phần mềm:
1. **[[Abstraction (Tính trừu tượng)]]**: Tập trung vào những đặc điểm cốt lõi của đối tượng, bỏ qua chi tiết triển khai cụ thể.
   - Thể hiện rõ nhất qua: **[[Abstract Class (Lớp trừu tượng)]]** & **[[Interface (Giao diện)]]**.
2. **[[Encapsulation (Tính đóng gói)]]**: Che giấu dữ liệu bên trong đối tượng, chỉ cho phép tương tác qua các phương thức công khai.
   - Kiểm soát chặt chẽ bằng các **[[Access Modifier (Phạm vi truy cập)]]**.
3. **[[Inheritance (Tính kế thừa)]]**: Cho phép một lớp con tái sử dụng và mở rộng các thuộc tính & phương thức của lớp cha.
4. **[[Polymorphism (Tính đa hình)]]**: Cho phép một hành vi được thực hiện theo nhiều cách khác nhau tùy thuộc vào đối tượng thực tế.

---

## 🔒 3. Phạm vi truy cập (Access Modifiers)
Công cụ hỗ trợ cho Tính đóng gói (Encapsulation), quy định quyền truy cập vào các thuộc tính/phương thức:
- **[[Public]]**: Truy cập tự do từ mọi nơi.
- **[[Protected]]**: Chỉ truy cập trong cùng package hoặc qua các lớp kế thừa.
- **[[Private]]**: Chỉ có thể truy cập bên trong chính class định nghĩa nó.
