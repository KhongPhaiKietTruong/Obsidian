# BÁO CÁO TOÀN DIỆN & TÀI LIỆU THUYẾT TRÌNH ĐỒ ÁN
## ĐỀ TÀI: HỆ THỐNG QUẢN LÝ SIÊU THỊ MINI (QUẢN LÝ SIÊU THỊ - BACKEND RESTFUL API)
**Học phần**: Công nghệ phần mềm (Software Engineering)  
**Nhóm thực hiện**: Nhóm 7  
**Sinh viên báo cáo**: Trương Anh Kiệt (MSSV: 24110267) cùng các thành viên nhóm  
**Thời gian báo cáo**: Học kỳ 1 - Năm học 2026  

---

# MỤC LỤC
1. [TỔNG QUAN DỰ ÁN & BỐI CẢNH BÀI TOÁN](#chương-1-tổng-quan-dự-án--bối-cảnh-bài-toán)
2. [ĐẶC TẢ YÊU CẦU PHẦN MỀM & PHÂN QUYỀN RBAC](#chương-2-đặc-tả-yêu-cầu-phần-mềm--phân-quyền-rbac)
3. [XÁC ĐỊNH 08 USE CASE CỐT LÕI (PRIORITY = HIGH)](#chương-3-xác-định-08-use-case-cốt-lõi-priority--high)
4. [THIẾT KẾ KIẾN TRÚC HỆ THỐNG & CƠ SỞ DỮ LIỆU](#chương-4-thiết-kế-kiến-trúc-hệ-thống--cơ-sở-dữ-liệu)
5. [HIỆN THỰC HÓA MÃ NGUỒN & CHUẨN HÓA API](#chương-5-hiện-thực-hóa-mã-nguồn--chuẩn-hóa-api)
6. [KIỂM THỬ & ĐẢM BẢO CHẤT LƯỢNG PHẦN MỀM](#chương-6-kiểm-thử--đảm-bảo-chất-lượng-phần-mềm)
7. [KỊCH BẢN THUYẾT TRÌNH TỪNG BƯỚC (10 - 15 PHÚT)](#chương-7-kịch-bản-thuyết-trình-từng-bước-10---15-phút)
8. [BỘ CÂU HỎI PHẢN BIỆN CỦA HỘI ĐỒNG & CÂU TRẢ LỜI MẪU (Q&A)](#chương-8-bộ-câu-hỏi-phản-biện-của-hội-đồng--câu-trả-lời-mẫu-qa)

---

# CHƯƠNG 1: TỔNG QUAN DỰ ÁN & BỐI CẢNH BÀI TOÁN

### 1.1. Bối cảnh thực tế và Lý do chọn đề tài
Trong mô hình bán lẻ hiện đại (Modern Trade), các chuỗi siêu thị mini và cửa hàng tiện lợi (như WinMart+, Circle K, FamilyMart) phải đối mặt với áp lực vận hành rất lớn:
- **Tốc độ thanh toán**: Khách mua hàng tại cửa hàng tiện lợi có xu hướng mua nhanh, nếu thao tác quẹt mã vạch, tính tiền, áp mã ưu đãi và thanh toán chậm sẽ gây ùn ứ tại quầy POS.
- **Thất thoát & Sai lệch kho**: Sai lệch giữa tồn kho thực tế trên kệ và tồn kho trong sổ sách do nhầm lẫn khi nhập hàng hoặc không ghi nhận kịp thời hàng hỏng, hàng hết hạn sử dụng.
- **Thanh toán không tiền mặt**: Nhu cầu thanh toán quét mã QR (VNPay, Mobile Banking) trở thành tiêu chuẩn bắt buộc bên cạnh tiền mặt.
- **Giữ chân khách hàng**: Thiếu cơ chế tích điểm thành viên (Loyalty Program) gắn liền với số điện thoại làm giảm tỷ lệ khách hàng quay lại.

Từ những thách thức trên, nhóm phát triển đã nghiên cứu và xây dựng **Hệ thống Quản lý Siêu thị Mini (Convenience Store Management System)**, tập trung phát triển hệ thống **Backend RESTful API chuẩn hóa, hiệu năng cao và an toàn giao dịch**.

### 1.2. Mục tiêu của dự án
1. **Chuẩn hóa quy trình bán hàng tại quầy (POS)**: Xử lý giỏ hàng nhanh chóng, tính toán tiền tự động, áp dụng khấu trừ điểm thưởng minh bạch và ghi nhận hóa đơn với tính toàn vẹn dữ liệu cao (Database Transaction).
2. **Kiểm soát kho vận chặt chẽ**: Quản lý vòng đời sản phẩm từ lúc nhập kho từ nhà cung cấp (`Purchase Receipt`), kiểm soát hạn sử dụng, điều chỉnh tồn kho tự động khi bán và hỗ trợ xử lý đổi trả hàng (`Return Receipt`).
3. **Tích hợp thanh toán số**: Kết nối cổng thanh toán quốc gia VNPay (xử lý chữ ký số SHA-512 và Webhook IPN tự động xác nhận đơn hàng).
4. **Phân quyền bảo mật chặt chẽ (RBAC)**: Bảo vệ tài nguyên theo vai trò của từng nhân viên thông qua cơ chế mã hóa mật khẩu `jBCrypt` và bảo mật kép với `JWT Access Token` + `HttpOnly Refresh Token Cookie`.
5. **Hỗ trợ ra quyết định kinh doanh**: Cung cấp báo cáo doanh thu đa chiều, cảnh báo tồn kho thấp và trích xuất dữ liệu động sang định dạng Excel (`.xlsx`).

### 1.3. Phạm vi hệ thống (System Scope)
- **Hệ thống Backend**: Cung cấp bộ API RESTful đầy đủ chuẩn HTTP JSON cho các ứng dụng Client (Web Dashboard dành cho Quản lý, Ứng dụng POS màn hình cảm ứng tại quầy thu ngân, hoặc Ứng dụng quét mã kho trên Mobile).
- **Cơ sở dữ liệu**: Thiết kế chuẩn hóa theo mô hình quan hệ trên PostgreSQL (hỗ trợ triển khai đám mây Neon DB).
- **Môi trường hoạt động**: Chạy trên máy chủ Servlet Container (Tomcat 10+) và sẵn sàng đóng gói Docker Container để triển khai lên hạ tầng Cloud (Render, AWS).

---

# CHƯƠNG 2: ĐẶC TẢ YÊU CẦU PHẦN MỀM & PHÂN QUYỀN RBAC

### 2.1. Phân quyền người dùng (Role-Based Access Control - RBAC)
Hệ thống thiết lập 3 nhóm người dùng có thẩm quyền khác nhau:
1. **`STORE_OWNER` (Chủ cửa hàng / Quản trị viên)**:
   - Toàn quyền quản trị hệ thống.
   - Quản lý tài khoản và phân công nhân viên (`/api/employee`).
   - Xem toàn bộ báo cáo doanh thu tài chính, lịch sử giao dịch và xuất báo cáo Excel (`/api/report`).
   - Cấu hình danh mục hàng hóa, giá niêm yết và chính sách tích điểm.
2. **`CASHIER` (Thu ngân tại quầy)**:
   - Tra cứu sản phẩm theo tên, mã vạch Barcode (`/api/product`).
   - Tạo và lập hóa đơn bán hàng (`/api/invoice`).
   - Xử lý thu tiền mặt hoặc kích hoạt mã VNPay QR (`/api/payment`).
   - Tra cứu khách hàng theo số điện thoại, đăng ký thành viên mới (`/api/customer`).
   - Tiếp nhận và xử lý đổi trả hàng từ hóa đơn hợp lệ (`/api/return-receipt`).
3. **`INVENTORY_MANAGER` (Thủ kho)**:
   - Quản lý kho hàng, tạo phiếu nhập hàng từ nhà cung cấp (`/api/purchase-receipt`).
   - Lập phiếu xuất hủy hàng hỏng, hàng hết date (`/api/disposal-receipt`).
   - Theo dõi cảnh báo sản phẩm sắp hết hàng trong kho.
   - Đối soát chênh lệch kiểm kê kho định kỳ (`/api/report/stock-discrepancy`).
4. **`Public` (Không yêu cầu đăng nhập)**:
   - Đăng nhập hệ thống (`POST /api/auth/login`).
   - Làm mới phiên làm việc (`POST /api/auth/refresh`).
   - Gửi đánh giá phản hồi về cửa hàng (`POST /api/feedback`).
   - Nhận tín hiệu xác nhận thanh toán từ ngân hàng (`GET /api/payment/vnpay-ipn`).

### 2.2. Danh mục 11 Modules chức năng
Hệ thống được chia thành 11 Module độc lập, mỗi module quản lý một phạm vi nghiệp vụ riêng biệt:
1. `Auth`: Xác thực tài khoản, cấp phát và thu hồi JWT token.
2. `Employee`: Hồ sơ nhân viên, trạng thái hoạt động, chức vụ.
3. `Category`: Phân loại nhóm hàng hóa (Nước giải khát, Thực phẩm khô, Hóa mỹ phẩm,...).
4. `Product`: Thông tin chi tiết sản phẩm, mã Barcode, giá bán lẻ, hạn dùng, tồn kho.
5. `Customer`: Thông tin thành viên, số điện thoại, điểm thưởng tích lũy.
6. `Purchase Receipt`: Quản lý nhập hàng từ nhà cung cấp vào kho.
7. `Invoice`: Bán hàng tại quầy, quản lý đơn hàng.
8. `Payment`: Giao dịch thanh toán tiền mặt và cổng thanh toán trực tuyến VNPay.
9. `Return Receipt`: Đổi trả hàng hóa và hoàn tiền cho khách.
10. `Report`: Tổng hợp doanh thu, kiểm kê kho, xuất báo cáo Excel.
11. `Feedback`: Đánh giá chất lượng dịch vụ của khách hàng.

---

# CHƯƠNG 3: XÁC ĐỊNH 08 USE CASE CỐT LÕI (PRIORITY = HIGH)

Để tối ưu hóa quá trình cài đặt và kiểm thử, nhóm đã chọn lọc **08 Use Case có mức độ ưu tiên CAO NHẤT (Priority = HIGH)** nằm trên luồng nghiệp vụ xương sống của hệ thống:

```
[UC-01: Đăng nhập] ──> [UC-05: Nhập hàng] ──> [UC-02: Quản lý hàng] ──> [UC-03: Bán hàng]
                                                                              │
[UC-08: Báo cáo] <── [UC-07: Đổi trả] <── [UC-04: Thanh toán] <── [UC-06: Tích điểm]
```

### 3.1. UC-01: Đăng nhập & Xác thực phân quyền hệ thống (`UC-AUTH-01`)
- **Tác nhân**: Tất cả nhân viên (`STORE_OWNER`, `CASHIER`, `INVENTORY_MANAGER`).
- **Mức độ ưu tiên**: **HIGH** (Bắt buộc cho mọi nghiệp vụ nội bộ).
- **Mục tiêu**: Đảm bảo an ninh dữ liệu, chỉ nhân viên hợp lệ mới được truy cập hệ thống theo đúng thẩm quyền.
- **Luồng xử lý chính**:
  1. Người dùng gửi `username` và `password`.
  2. Hệ thống tìm kiếm nhân viên, dùng `jBCrypt` đối soát chuỗi băm mật khẩu.
  3. Nếu khớp, hệ thống sinh ra `accessToken` (chứa ID, tên, quyền `position`) và `refreshToken`.
  4. Trả về `accessToken` trong body JSON và tự động gán `refreshToken` vào Cookie bảo mật `HttpOnly`.

### 3.2. UC-02: Quản lý & Tra cứu sản phẩm theo Barcode (`UC-PROD-01`)
- **Tác nhân**: Thu ngân, Thủ kho, Chủ cửa hàng.
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Cung cấp dữ liệu tức thời về tên, giá bán và số lượng tồn kho của hàng hóa.
- **Luồng xử lý chính**:
  1. Thu ngân quét máy quét Barcode hoặc nhập từ khóa tìm kiếm.
  2. Hệ thống truy vấn index mã vạch hoặc full-text search tên sản phẩm.
  3. Trả về thông tin sản phẩm, hình ảnh, đơn giá và số lượng khả dụng trong kho.

### 3.3. UC-03: Lập hóa đơn bán hàng tại quầy (`UC-INV-01`)
- **Tác nhân**: Thu ngân (`CASHIER`).
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Tạo đơn hàng, kiểm tra tính sẵn sàng của hàng tồn kho và áp dụng chính sách giảm giá điểm thưởng.
- **Luồng xử lý chính**:
  1. Thu ngân chọn khách hàng (hoặc khách vãng lai) và danh sách mặt hàng khách mua.
  2. Hệ thống duyệt từng mặt hàng, kiểm tra ràng buộc `stockQuantity >= quantity`. Nếu không đủ hàng, lập tức báo lỗi và từ chối.
  3. Hệ thống tính thành tiền từng món, tính chiết khấu điểm tích lũy của khách (100.000 điểm = 1.000 VNĐ giảm trừ).
  4. Khởi tạo Database Transaction: Lưu bản ghi `Invoice` trạng thái `PENDING`, lưu danh sách `InvoiceDetail`, trừ trực tiếp tồn kho sản phẩm để tránh bán âm kho.

### 3.4. UC-04: Xử lý thanh toán hóa đơn (`UC-PAY-01`)
- **Tác nhân**: Thu ngân, Khách hàng, Cổng thanh toán VNPay.
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Thu tiền đơn hàng và hoàn tất giao dịch.
- **Luồng xử lý chính**:
  - **Phương thức Tiền mặt (`CASH`)**: Thu ngân thu tiền mặt từ khách $\rightarrow$ Hệ thống tạo bản ghi `Payment` với trạng thái `PAID` $\rightarrow$ Chuyển `Invoice` sang `PAID` $\rightarrow$ In hóa đơn cho khách.
  - **Phương thức VNPay (`VNPAY`)**: Hệ thống tạo URL thanh toán chứa chữ ký SHA-512 bảo mật $\rightarrow$ Khách hàng quét mã QR $\rightarrow$ VNPay gửi kết quả về qua Webhook IPN (`/api/payment/vnpay-ipn`) $\rightarrow$ Hệ thống tự động xác thực chữ ký và cập nhật `Invoice` sang `PAID`.

### 3.5. UC-05: Nhập hàng vào kho (`UC-PUR-01`)
- **Tác nhân**: Thủ kho (`INVENTORY_MANAGER`), Chủ cửa hàng.
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Ghi nhận lô hàng nhập từ nhà phân phối, cập nhật giá vốn nhập và tăng số lượng tồn kho.
- **Luồng xử lý chính**:
  1. Thủ kho nhập tên nhà cung cấp và danh sách các sản phẩm cần nhập (kèm đơn giá nhập, số lượng, hạn sử dụng).
  2. Đối với sản phẩm mới: Hệ thống tự động khởi tạo sản phẩm vào danh mục.
  3. Hệ thống lưu phiếu nhập `voucher`, chi tiết `voucher_detail`, cộng dồn số lượng vào kho: `stockQuantity = stockQuantity + purchasedQuantity` và cập nhật giá vốn mới nhất.

### 3.6. UC-06: Quản lý khách hàng & Tích lũy điểm hội viên (`UC-CUST-01`)
- **Tác nhân**: Thu ngân, Khách hàng.
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Gắn kết khách hàng thân thiết, tự động cộng/trừ điểm thưởng trên mỗi lượt mua sắm.
- **Luồng xử lý chính**:
  1. Thu ngân tra cứu nhanh thông tin hội viên qua số điện thoại khi bắt đầu tạo đơn.
  2. Nếu là khách mới: Thu ngân nhập nhanh Họ tên và Số điện thoại để hệ thống cấp mã thẻ thành viên.
  3. Sau khi hóa đơn được thanh toán thành công: Hệ thống tự động cộng điểm tích lũy theo tỷ lệ quy định (10.000 VNĐ đơn hàng $\rightarrow$ +100 điểm thưởng).

### 3.7. UC-07: Đổi trả hàng hóa & Hoàn tiền (`UC-RET-01`)
- **Tác nhân**: Thu ngân, Khách hàng.
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Xử lý trả hàng đối với các sản phẩm lỗi hoặc khách mua nhầm mà vẫn giữ vững tính nhất quán của kho hàng và dòng tiền.
- **Luồng xử lý chính**:
  1. Thu ngân nhập mã hóa đơn gốc `invoiceId` và lý do đổi trả.
  2. Hệ thống kiểm tra: Hóa đơn phải tồn tại, đã ở trạng thái `PAID`, và số lượng hàng trả không được vượt quá số lượng trên hóa đơn gốc.
  3. Hệ thống tính số tiền hoàn trả (`refundAmount`), lập phiếu trả hàng `return_receipt`.
  4. Hệ thống tự động cộng hoàn số lượng sản phẩm trả lại vào kho hàng: `stockQuantity = stockQuantity + returnedQuantity`.

### 3.8. UC-08: Thống kê báo cáo doanh thu & Kiểm soát tồn kho (`UC-REP-01`)
- **Tác nhân**: Chủ cửa hàng (`STORE_OWNER`).
- **Mức độ ưu tiên**: **HIGH**.
- **Mục tiêu**: Cung cấp bức tranh toàn cảnh về tình hình tài chính và rủi ro tồn đọng hàng hóa.
- **Luồng xử lý chính**:
  1. Chủ cửa hàng truy vấn theo khoảng thời gian (`fromDate` đến `toDate`).
  2. Hệ thống tổng hợp: Doanh thu thực thu, tiền giảm trừ điểm thưởng, tổng số lượng hóa đơn, phân bố theo phương thức thanh toán.
  3. Hệ thống truy vấn danh sách các mặt hàng có tồn kho dưới định mức an toàn hoặc sắp hết hạn sử dụng.
  4. Cung cấp tính năng kết xuất dữ liệu trực tiếp sang file Excel (`.xlsx`) thông qua thư viện Apache POI.

---

# CHƯƠNG 4: THIẾT KẾ KIẾN TRÚC HỆ THỐNG & CƠ SỞ DỮ LIỆU

### 4.1. Kiến trúc phân tầng Module-based Layered Architecture
Dự án được tổ chức theo mô hình phân tầng chặt chẽ kết hợp hướng module:
1. **Presentation / Controller Layer (`com.mycompany.quanlysieuthi.modules.*.*Controller`)**:
   - Tiếp nhận HTTP Request (GET, POST, PUT, DELETE).
   - Kiểm tra định dạng dữ liệu đầu vào.
   - Gọi tầng Service xử lý và đóng gói dữ liệu phản hồi dạng JSON chuẩn.
2. **Business Logic / Service Layer (`*Service`)**:
   - Đảm nhận toàn bộ nghiệp vụ cốt lõi: kiểm tra tồn kho, tính toán chiết khấu, sinh mã định danh tự động, điều phối giao dịch Database.
3. **Data Access / Repository Layer (`*Repository`)**:
   - Thực thi các câu truy vấn HQL/SQL thông qua Hibernate EntityManager/Session.
   - Đảm bảo tính trừu tượng hóa tương tác cơ sở dữ liệu.
4. **Data Transfer Object (`*Request`, `*Response`)**:
   - Sử dụng **Java Records (tính năng hiện đại từ Java 14+)**: Tạo ra các đối tượng bất biến (Immutable), ngăn chặn lỗi rò rỉ dữ liệu hoặc thay đổi trạng thái ngoài ý muốn.
5. **Security & Middleware Layer (`middleware/`)**:
   - `JwtAuthFilter`: Kiểm tra token ở mọi request được bảo vệ.
   - `RoleFilter`: Kiểm soát phân quyền RBAC dựa trên JWT Claim.
   - `CorsFilter`: Xử lý cấu hình Cross-Origin Resource Sharing cho phép Frontend gọi API an toàn kèm Cookie.

### 4.2. Công nghệ sử dụng và Lý do lựa chọn (Tech Stack Justification)
- **Java 17 & Jakarta Servlet API 6.0**: Cung cấp nền tảng vững chắc, tối ưu tài nguyên máy chủ, chạy trực tiếp trên Apache Tomcat 10+. Việc dùng Servlet API thuần giúp nhóm hiểu sâu sắc về kiến trúc Web Container, vòng đời Request/Response và cơ chế Filter của Java.
- **Hibernate Core 6.5**: ORM hàng đầu thế giới, tự động ánh xạ bảng dữ liệu quan hệ, quản lý Session và tối ưu hóa truy vấn.
- **HikariCP 5.1.0**: Thư viện Connection Pool nhanh và nhẹ nhất hiện nay, tái sử dụng kết nối CSDL, loại bỏ độ trễ khi có nhiều kết nối đồng thời.
- **PostgreSQL**: Hệ quản trị cơ sở dữ liệu quan hệ mạnh mẽ, hỗ trợ toàn vẹn ACID, tương thích dịch vụ Neon Cloud Serverless.
- **Redis Cache (Jedis)**: Caching dữ liệu danh mục và blacklist token, giảm tải truy vấn lặp lại xuống Database.
- **JJWT & jBCrypt**: Tiêu chuẩn bảo mật mã hóa mật khẩu một chiều và sinh token xác thực không trạng thái (Stateless Authentication).
- **Apache POI 5.2.5**: Thư viện xử lý bảng tính Excel chuyên nghiệp của Apache Software Foundation.
- **Docker & Render**: Đóng gói ứng dụng thành Container độc lập, loại bỏ lỗi lệch môi trường khi demo hoặc triển khai.

### 4.3. Thiết kế Cơ sở dữ liệu (Database Schema / ERD)
Hệ thống gồm 16 thực thể chính, được liên kết qua các khóa ngoại toàn vẹn:
- `EMPLOYEE`: Lưu trữ nhân viên, tài khoản, mật khẩu băm, vai trò và refresh token.
- `CUSTOMER`: Thông tin hội viên, số điện thoại (Unique index), điểm tích lũy (`loyalty_points`).
- `PRODUCT_CATEGORY`: Danh mục hàng hóa (đồ uống, bánh kẹo, hóa mỹ phẩm,...).
- `PRODUCT`: Mặt hàng, mã vạch Barcode (Unique), đơn giá bán, số lượng tồn kho (`stock_quantity`), hạn sử dụng.
- `INVOICE` & `INVOICE_DETAIL`: Hóa đơn bán lẻ, liên kết với nhân viên lập và khách hàng, lưu tổng tiền, tiền chiết khấu và trạng thái (`PENDING`, `PAID`, `CANCELLED`).
- `PAYMENT`: Bản ghi giao dịch thanh toán, phương thức (`CASH`, `VNPAY`), mã giao dịch đối soát.
- `PURCHASE_RECEIPT` & `PURCHASE_RECEIPT_DETAIL`: Phiếu nhập hàng từ nhà cung cấp, lưu giá mua và số lượng nhập.
- `RETURN_RECEIPT` & `RETURN_RECEIPT_DETAIL`: Phiếu trả hàng, liên kết với hóa đơn gốc, lưu số tiền hoàn và số lượng trả lại kho.
- `DISPOSAL_RECEIPT`: Phiếu hủy hàng quá hạn hoặc hư hỏng trong quá trình lưu trữ.
- `INVENTORY_REPORT`: Báo cáo đối soát kiểm kê kho định kỳ.
- `FEEDBACK`: Đánh giá chấm điểm sao (1 đến 5 sao) và phản hồi của khách hàng.

---

# CHƯƠNG 5: HIỆN THỰC HÓA MÃ NGUỒN & CHUẨN HÓA API

### 5.1. Quy chuẩn Response JSON đồng nhất
Hệ thống tuân thủ nghiêm ngặt chuẩn định dạng RESTful API:

**a. Phản hồi thành công thông thường (200 OK / 201 CREATED):**
```json
{
  "status": 200,
  "message": "Thực hiện thành công",
  "data": { ... }
}
```

**b. Phản hồi danh sách có phân trang (Pagination):**
```json
{
  "status": 200,
  "message": "Lấy danh sách thành công",
  "data": [ ... ],
  "meta": {
    "currentPage": 1,
    "totalPages": 5,
    "totalItems": 48,
    "pageSize": 10
  }
}
```

**c. Phản hồi bắt lỗi nghiệp vụ (Error Handling):**
```json
{
  "status": 400,
  "message": "Số lượng tồn kho không đủ để thực hiện bán hàng"
}
```

### 5.2. Các Mã HTTP Status Code được quản lý chặt chẽ
- `200 OK`: Truy vấn, cập nhật dữ liệu thành công.
- `201 CREATED`: Tạo mới hóa đơn, phiếu nhập, sản phẩm thành công.
- `400 BAD REQUEST`: Sai dữ liệu đầu vào hoặc vi phạm logic nghiệp vụ (ví dụ: tồn kho không đủ, trả hàng vượt quá số lượng mua).
- `401 UNAUTHORIZED`: Chưa đăng nhập, thiếu token hoặc token hết hạn.
- `403 FORBIDDEN`: Không có quyền truy cập (ví dụ: Thu ngân cố tình gọi API xóa nhân viên).
- `404 NOT FOUND`: Không tìm thấy tài nguyên theo ID.
- `409 CONFLICT`: Trùng lặp dữ liệu duy nhất (ví dụ: trùng Barcode, trùng số điện thoại).
- `500 INTERNAL SERVER ERROR`: Lỗi ngoại lệ chưa xác định tại máy chủ.

---

# CHƯƠNG 6: KIỂM THỬ & ĐẢM BẢO CHẤT LƯỢNG PHẦN MỀM

### 6.1. Chiến lược kiểm thử đa tầng
1. **Unit Testing (Kiểm thử đơn vị)**:
   - Sử dụng **JUnit 5 Jupiter** kết hợp thư viện Mock **Mockito 5.11**.
   - Kiểm thử độc lập logic tại tầng Service: Giả lập (Mock) các lời gọi xuống Repository để kiểm tra tính toán tiền, logic áp mã giảm giá, kiểm tra điều kiện tồn kho.
2. **Integration Testing (Kiểm thử tích hợp API)**:
   - Sử dụng bộ sưu tập Postman Collection sẵn có (`QuanLySieuThi_Postman_Collection.json`) để kiểm thử đầu - cuối (End-to-End).
   - Kiểm thử chuỗi kịch bản: `Đăng nhập -> Lấy Token -> Tạo hóa đơn -> Thanh toán -> Kiểm tra tồn kho đã bị trừ`.

### 6.2. Kiểm thử các trường hợp biên và ngoại lệ (Corner Cases)
- **Tồn kho bằng 0 hoặc không đủ**: Hệ thống lập tức hủy giao dịch (Rollback Transaction) và phản hồi `400 Bad Request`.
- **Đổi trả hàng cho hóa đơn chưa thanh toán**: Hệ thống từ chối lập phiếu trả và báo lỗi "Chỉ được trả hàng cho hóa đơn đã thanh toán".
- **Hết hạn Token**: Filter nhận diện JWT hết hạn, tự động trả về `401`, kích hoạt Client gọi `/api/auth/refresh` bằng cookie `HttpOnly` để cấp mới token mà không làm gián đoạn trải nghiệm người dùng.
- **Trùng lặp Webhook VNPay**: Cổng VNPay có thể gửi Webhook nhiều lần cho cùng một giao dịch; hệ thống kiểm tra trạng thái thanh toán hiện tại, nếu đã `PAID` thì không cập nhật lại, tránh cộng điểm thưởng hai lần.

### 6.4. Ma trận truy vết yêu cầu (Requirements Traceability Matrix)
*(Với mỗi use case đã cài đặt, chỉ ra cụ thể class, phương thức, sequence diagram, vị trí code (file và dòng), và test case tương ứng.)*

| UC / Story ID | Class / Method | Sequence Diagram | Vị trí code (file, dòng) | Test Case |
| :--- | :--- | :--- | :--- | :--- |
| **UC-01**<br>Đăng nhập | `AuthController.handleLogin`<br>`AuthService.login`<br>`AuthRepository.findByUsername` | `Authentication_Flow.png` | • `AuthController.java` (dòng 38-63)<br>• `AuthService.java` (dòng 24-71)<br>• `AuthRepository.java` (dòng 28-35) | • Postman: `1.1 Login - STORE_OWNER`<br>• Postman: `1.2 Login - CASHIER`<br>• Postman: `1.3 Login - INVENTORY_MANAGER` |
| **UC-02**<br>Xem báo cáo doanh thu | `ReportController.handleGetRevenueReport`<br>`ReportController.handleExportExcel`<br>`ReportService.getRevenueReport`<br>`ReportService.exportRevenueExcel` | `class_diagram.jpg` | • `ReportController.java` (dòng 39-44, 98-125)<br>• `ReportService.java` (dòng 30-95, 120-175)<br>• `ReportRepository.java` (dòng 25-70) | • Postman: `7.4 Get Payment Summary Revenue - Expect 200`<br>• Postman: `9.1 Get Stock Discrepancy Reports` |
| **UC-03**<br>Xuất kho | `DisposalReceiptController.doPost`<br>`DisposalReceiptService.createDisposalReceipt`<br>`InvoiceService.createInvoice` (trừ kho tự động) | `Checkout_Invoice_Creation.png` | • `DisposalReceiptController.java` (dòng 33-49)<br>• `DisposalReceiptService.java` (dòng 37-110)<br>• `InvoiceService.java` (dòng 71-77, 115-125) | • JUnit: `InvoiceServiceTest.testCreateInvoice_InsufficientStock_ThrowsBadRequest`<br>• Postman: `6.1 Create Invoice POS` (Kiểm thử trừ tồn kho) |
| **UC-04**<br>Tạo đơn hàng | `InvoiceController.doPost`<br>`InvoiceService.createInvoice`<br>`InvoiceRepository.saveInvoice` | `Checkout_Invoice_Creation.png` | • `InvoiceController.java` (dòng 23-41)<br>• `InvoiceService.java` (dòng 36-126)<br>• `InvoiceRepository.java` (dòng 70-135) | • JUnit: `InvoiceServiceTest.testCreateInvoice_Success`<br>• JUnit: `InvoiceServiceTest.testCreateInvoice_UseLoyaltyPoints`<br>• Postman: `6.1 Create Invoice POS - Expect 201` |
| **UC-05**<br>Hủy đơn | `InvoiceController.doDelete`<br>`InvoiceService.cancelInvoice`<br>`InvoiceRepository.cancelInvoice` | `Checkout_Invoice_Creation.png` | • `InvoiceController.java` (dòng 54-63)<br>• `InvoiceService.java` (dòng 164-173)<br>• `InvoiceRepository.java` (dòng 160-185) | • JUnit: `InvoiceServiceTest.testCancelInvoice_Success`<br>• JUnit: `InvoiceServiceTest.testCancelInvoice_NotFound_ThrowsNotFoundException`<br>• Postman: `6.4 Cancel Pending Invoice - Expect 200` |
| **UC-06**<br>Thanh toán | `PaymentController.handleProcessPayment`<br>`PaymentController.handleVnPayIpn`<br>`PaymentService.processPayment`<br>`PaymentService.handleVnPayIpn` | `Payment_Webhook_IPN.png` | • `PaymentController.java` (dòng 67-84)<br>• `PaymentService.java` (dòng 45-135)<br>• `PaymentRepository.java` (dòng 30-75) | • Postman: `7.1 Process Cash Payment - Expect 200`<br>• Postman: `7.2 Process VNPay Payment - Expect 200`<br>• Postman: `7.3 Get Transactions List - Expect 200` |
| **UC-07**<br>Nhập hàng | `PurchaseReceiptController.doPost`<br>`PurchaseReceiptService.createPurchaseReceipt`<br>`PurchaseReceiptRepository.saveReceipt` | `Purchase_Receipt.png` | • `PurchaseReceiptController.java` (dòng 33-49)<br>• `PurchaseReceiptService.java` (dòng 35-120)<br>• `PurchaseReceiptRepository.java` (dòng 40-95) | • JUnit: `PurchaseReceiptServiceTest.testCreatePurchaseReceipt_Success`<br>• JUnit: `PurchaseReceiptServiceTest.testCreatePurchaseReceipt_NegativeQuantity`<br>• Postman: `5.3 Create Purchase Receipt - Expect 201` |

---

# CHƯƠNG 7. KẾT LUẬN

### 7.1 Kết quả đạt được so với phạm vi đã cam kết
*(Đối chiếu với use case lõi và phạm vi TRONG scope đã cam kết trong hồ sơ đề tài, có điều chỉnh gì và vì sao.)*

#### a. Đối chiếu kết quả thực hiện các Use Case lõi trong Scope:
Hệ thống đã hoàn thành **100% các Use Case cốt lõi** nằm trong phạm vi (In-Scope) đã cam kết trong hồ sơ đề tài ban đầu, cụ thể:
1. **UC-01 (Đăng nhập)**: Hoàn thành 100%. Xác thực thành công người dùng với cơ chế mã hóa mật khẩu `jBCrypt`, cấp phát cặp token bảo mật (JWT Access Token & HttpOnly Refresh Token Cookie) và phân quyền chặt chẽ theo 3 vai trò (`STORE_OWNER`, `CASHIER`, `INVENTORY_MANAGER`).
2. **UC-02 (Xem báo cáo doanh thu)**: Hoàn thành 100%. Tổng hợp doanh thu thực tế, tiền giảm trừ điểm thưởng, phân loại doanh thu theo phương thức thanh toán trong khoảng thời gian tùy chọn và hỗ trợ xuất báo cáo Excel chuẩn định dạng `.xlsx`.
3. **UC-03 (Xuất kho)**: Hoàn thành 100%. Hiện thực hóa qua 2 cơ chế nghiệp vụ: tự động trừ số lượng tồn kho tức thì khi tạo đơn hàng bán lẻ tại quầy POS (`InvoiceService`) và lập phiếu xuất hủy hàng hỏng/hết hạn (`DisposalReceiptService`), bảo đảm không xảy ra hiện tượng âm kho.
4. **UC-04 (Tạo đơn hàng)**: Hoàn thành 100%. Thu ngân lập hóa đơn bán lẻ, kiểm tra tồn kho từng mặt hàng, tự động quy đổi và trừ điểm tích lũy thành viên, tính tổng tiền và tạo hóa đơn trạng thái `PENDING` theo cơ chế Database Transaction an toàn.
5. **UC-05 (Hủy đơn)**: Hoàn thành 100%. Cho phép hủy các hóa đơn đang chờ thanh toán (`PENDING`) khi khách đổi ý, cập nhật trạng thái `CANCELLED` và giải phóng khóa sản phẩm.
6. **UC-06 (Thanh toán)**: Hoàn thành 100%. Hỗ trợ 2 phương thức: thanh toán Tiền mặt (`CASH`) và Cổng thanh toán trực tuyến `VNPay QR`, tiếp nhận Webhook IPN xử lý chữ ký SHA-512 tự động chuyển hóa đơn sang `PAID` và cộng điểm tích lũy thành viên.
7. **UC-07 (Nhập hàng)**: Hoàn thành 100%. Lập phiếu nhập kho từ nhà cung cấp, cập nhật giá vốn nhập, tự động cộng tăng số lượng tồn kho sản phẩm và hỗ trợ tạo sản phẩm mới nếu chưa có trong danh mục.

#### b. Các điều chỉnh so với cam kết ban đầu và lý do:
- **Tích hợp cổng thanh toán trực tuyến VNPay QR**: Ban đầu đề tài chỉ dự kiến thanh toán tiền mặt truyền thống. Tuy nhiên, qua khảo sát thực tế thói quen tiêu dùng không tiền mặt của khách hàng, nhóm đã quyết định mở rộng tích hợp thêm cổng VNPay Sandbox với Webhook IPN để nâng cao tính thực tiễn và tính hiện đại của giải pháp.
- **Nâng cấp cơ chế bảo mật kép JWT + HttpOnly Cookie**: Ban đầu dự kiến dùng Session lưu trong Servlet Context hoặc JWT lưu ở LocalStorage. Để tuân thủ chuẩn an toàn thông tin OWASP chống tấn công XSS (Cross-Site Scripting), nhóm đã điều chỉnh lưu Refresh Token vào Cookie có cờ `HttpOnly; Secure; SameSite=Strict`.
- **Dời các tính năng ngoài luồng chính sang giai đoạn mở rộng**: Các tính năng phụ như Đánh giá 5 sao kèm bình luận (`Feedback`) hay Hệ thống tạo Voucher giảm giá đa tầng phức tạp được điều chỉnh thành phạm vi giai đoạn 2 để nhóm dồn toàn lực tối ưu hóa tính toàn vẹn (ACID Transaction) của luồng Bán hàng - Nhập kho - Trừ tồn kho.

---

### 7.2 Khó khăn và bài học kinh nghiệm

#### a. Khó khăn gặp phải:
1. **Bài toán tranh chấp đồng thời (Concurrency / Race Condition)**: Khi nhiều quầy thu ngân cùng bán một sản phẩm có số lượng tồn kho ít (chỉ còn 1 - 2 món). Nếu không kiểm soát tốt, việc đọc dữ liệu đồng thời có thể dẫn đến hiện tượng bán âm kho (bán nhiều hơn số lượng thực có).
2. **Quản trị kết nối và Session khi dùng Servlet thuần**: Không sử dụng các framework cấp cao như Spring Boot đòi hỏi nhóm phải tự tay cấu hình Hibernate EntityManager, quản trị Connection Pool (HikariCP) và kiểm soát vòng đời Transaction để không bị rò rỉ kết nối (Connection Leak).
3. **Kiểm thử Webhook bên thứ ba (VNPay IPN)**: Cổng VNPay yêu cầu một URL Public qua Internet để gửi tín hiệu IPN xác nhận. Trong quá trình phát triển ở môi trường Localhost, nhóm phải thiết lập Reverse Proxy (Ngrok tunneling) và xử lý xác thực chữ ký SHA-512 với thứ tự tham số alphabet nghiêm ngặt.
4. **Đồng bộ hóa luồng dữ liệu đổi trả và tích điểm**: Xử lý logic nghiệp vụ khi khách hàng trả hàng phải vừa cộng lại số lượng vào kho, vừa hoàn tiền chính xác, đồng thời phải trừ ngược số điểm thưởng đã cộng trước đó từ tài khoản thành viên của khách.

#### b. Bài học kinh nghiệm:
- **Hiểu sâu sắc bản chất nền tảng Web Java**: Việc trực tiếp làm việc với Jakarta Servlet 6.0, Filter Chain và Tomcat Container giúp các thành viên nắm vững luồng đi của HTTP Request từ lúc vào máy chủ đến khi trả về Response, điều mà các framework tự động hóa thường ẩn giấu.
- **Tầm quan trọng của Database Transaction (ACID)**: Rút ra bài học phải luôn nhóm các thao tác thay đổi dữ liệu phụ thuộc (tạo đơn hàng + trừ tồn kho + tích điểm) vào một Transaction duy nhất có khối `try-catch rollback` để dữ liệu kế toán luôn toàn vẹn.
- **Thiết kế API hướng chuẩn hóa (RESTful Specification)**: Xây dựng tài liệu API rõ ràng ([API_DOCUMENTATION.md](file:///home/kiettruong/Documents/Obsidian/4.Rarely_See/University/3rd%20HK1/Cong_nghe_phan_mem/market/QuanLySieuThi/API_DOCUMENTATION.md)) cùng Postman Collection từ giai đoạn đầu giúp việc kiểm thử và tích hợp giữa các thành viên diễn ra trơn tru, giảm thiểu xung đột.
- **Kỹ năng làm việc nhóm và giải quyết vấn đề**: Học được cách phân chia module độc lập (Feature-based Modular), áp dụng Git workflow chuẩn chỉnh (Feature branch, Pull Request) và cách viết Unit Test với JUnit 5/Mockito để tự tin tái cấu trúc code.

---

### 7.3 Yêu cầu phát sinh phát hiện thêm
*(Những yêu cầu phát hiện thêm qua khảo sát, phỏng vấn thực tế tại các cửa hàng tiện lợi / siêu thị mini, ngoài hồ sơ đề tài ban đầu)*

1. **Yêu cầu hỗ trợ quét mã vạch (Barcode Scanner) siêu tốc**:
   - Qua khảo sát nhân viên thu ngân thực tế, hơn 95% thao tác chọn hàng tại quầy được thực hiện bằng máy quét mã vạch thay vì gõ tìm kiếm theo tên.
   - Phát sinh yêu cầu: Hệ thống phải có endpoint tra cứu Barcode chuyên biệt (`/api/product/barcode/:code`) được đánh Index duy nhất (`UNIQUE INDEX`) ở CSDL để tốc độ truy xuất đạt dưới 20ms.
2. **Yêu cầu cảnh báo hàng cận date (hạn sử dụng) và ngưỡng tồn kho tối thiểu (Low-stock Alerts)**:
   - Các cửa hàng tiện lợi kinh doanh nhiều mặt hàng thực phẩm, nước giải khát có hạn dùng ngắn (Fresh Food, Dairy). Nhân viên kho rất khó kiểm soát bằng mắt thường.
   - Phát sinh yêu cầu: Hệ thống cần có màn hình/endpoint tự động cảnh báo các sản phẩm có tồn kho thấp hơn ngưỡng an toàn (`stockQuantity < threshold`) và các lô hàng sắp hết hạn trong vòng 30 ngày để chủ cửa hàng kịp thời triển khai xả hàng giảm giá.
3. **Yêu cầu tính lũy đẳng (Idempotency) trong xử lý thanh toán**:
   - Trong giờ cao điểm, mạng chập chờn có thể khiến thu ngân bấm nút "Thanh toán" liên tiếp 2 lần, hoặc cổng VNPay gửi lặp lại Webhook IPN khi xác nhận giao dịch.
   - Phát sinh yêu cầu: Backend phải kiểm tra trạng thái đơn hàng trước khi xử lý, nếu đơn hàng đã ở trạng thái `PAID` thì chỉ phản hồi xác nhận mà không thực hiện trừ kho hoặc cộng điểm thưởng lần thứ hai.
4. **Yêu cầu xuất báo cáo thống kê định dạng bảng tính Excel (.xlsx)**:
   - Chủ cửa hàng và kế toán viên có thói quen đối soát số liệu và lưu trữ hồ sơ thuế thông qua file Excel thay vì chỉ xem bảng số liệu trên màn hình web.
   - Phát sinh yêu cầu: Bổ sung thư viện `Apache POI` để kết xuất dữ liệu động sang file Excel chuẩn với đầy đủ định dạng số tiền, ngày giờ và tiêu đề cột rõ ràng.

---

### 7.4 Hướng phát triển tiếp theo

1. **Hoàn thiện giao diện người dùng (Frontend & Mobile App)**:
   - Phát triển ứng dụng Web POS dành riêng cho màn hình cảm ứng tại quầy thu ngân (sử dụng React / Vue.js) tối ưu hóa thao tác bàn phím số và máy quét barcode.
   - Xây dựng ứng dụng di động (Flutter / React Native) dành cho Chủ cửa hàng để theo dõi doanh thu theo thời gian thực (Real-time Dashboard) và nhận thông báo cảnh báo tồn kho trên điện thoại.
2. **Mở rộng mô hình Bán hàng đa kênh (Omnichannel Commerce)**:
   - Xây dựng API Webhook tích hợp với các nền tảng thương mại điện tử và giao hàng nhanh (GrabMart, ShopeeFood, Baemin) giúp tự động đồng bộ số lượng tồn kho theo thời gian thực giữa quầy bán lẻ và cửa hàng trực tuyến.
3. **Ứng dụng Trí tuệ nhân tạo (AI & Machine Learning)**:
   - **Dự báo nhu cầu nhập hàng (Demand Forecasting)**: Phân tích lịch sử bán hàng theo ngày trong tuần, thời tiết và các dịp lễ Tết để đưa ra gợi ý số lượng nhập hàng tối ưu cho thủ kho, giảm thiểu tình trạng tồn ứ vốn hoặc thiếu hàng bán.
   - **Gợi ý bán kèm (Cross-selling / Market Basket Analysis)**: Thuật toán Apriori gợi ý cho thu ngân các sản phẩm khách hay mua kèm (ví dụ: khách mua mì ly $\rightarrow$ gợi ý xúc xích/nước suối) để tăng giá trị đơn hàng trung bình.
4. **Nâng cấp kiến trúc hệ thống và Cloud Scaling**:
   - Tách các module có tải trọng cao (như Bán hàng / Thanh toán) thành các Microservices độc lập khi quy mô chuỗi siêu thị mở rộng trên 20 chi nhánh.
   - Tích hợp Message Broker (RabbitMQ / Apache Kafka) để xử lý bất đồng bộ các tác vụ nặng như xuất báo cáo Excel, gửi hóa đơn điện tử qua Email/Zalo ZNS cho khách hàng.

---

# PHỤ LỤC A: KỊCH BẢN THUYẾT TRÌNH BẢO VỆ ĐỒ ÁN (10 - 15 PHÚT)


Dưới đây là kịch bản chuẩn giúp nhóm làm chủ bài báo cáo trước hội đồng chấm thi:

### ⏱️ PHẦN 1: MỞ ĐẦU & GIỚI THIỆU TỔNG QUAN (2 PHÚT)
- **Lời nói gợi ý**:  
  > *"Kính thưa Thầy/Cô trong Hội đồng và các bạn. Em là Trương Anh Kiệt, đại diện Nhóm 7 xin phép được trình bày đồ án môn Công nghệ phần mềm: **Xây dựng Hệ thống Backend Quản lý Siêu thị Mini và Cửa hàng Tiện lợi**.*  
  > *Trong bối cảnh bán lẻ hiện đại, tốc độ phục vụ tại quầy, tính chính xác của tồn kho và thanh toán số là yếu tố sống còn. Nhóm chúng em đã tập trung phát triển giải pháp Backend RESTful API tối ưu hiệu năng trên nền tảng Java 17, Hibernate 6 và PostgreSQL nhằm giải quyết triệt để các bài toán này."*

### ⏱️ PHẦN 2: BÀI TOÁN NGHIỆP VỤ & 08 USE CASE CỐT LÕI (3 PHÚT)
- Trình bày sơ đồ luồng nghiệp vụ vòng tròn:
  > *"Hệ thống bao quát trọn vẹn vòng đời nghiệp vụ bán lẻ với 8 Use Case ưu tiên cao nhất: Bắt đầu từ xác thực đăng nhập phân quyền RBAC $\rightarrow$ Nhập kho hàng hóa $\rightarrow$ Quản lý sản phẩm Barcode $\rightarrow$ Tạo hóa đơn bán lẻ tại quầy $\rightarrow$ Tích điểm hội viên $\rightarrow$ Thanh toán đa kênh tiền mặt và VNPay QR $\rightarrow$ Đổi trả hàng hóa bảo toàn kho $\rightarrow$ Thống kê doanh thu và xuất báo cáo Excel."*

### ⏱️ PHẦN 3: KIẾN TRÚC KỸ THUẬT & ĐIỂM NỔI BẬT (3 PHÚT)
- Nêu bật 4 điểm sáng về mặt kỹ thuật:
  1. **Kiến trúc Layered theo Module**: Mã nguồn trong sáng, phân tách rõ ràng giữa Controller, Service, Repository và Entity.
  2. **Java Records DTO**: Dữ liệu gửi nhận bất biến (Immutable), tránh lỗi side-effect.
  3. **Giao dịch Database an toàn (ACID)**: Thao tác tạo đơn hàng và trừ kho được gom trong một Transaction duy nhất, đảm bảo không bao giờ bị âm kho hoặc bán hàng ảo.
  4. **Bảo mật chuẩn quốc tế**: Mật khẩu mã hóa `jBCrypt`, cơ chế Token kép (JWT Access Token + Refresh Token trong `HttpOnly` Cookie chống tấn công XSS).

### ⏱️ PHẦN 4: DEMO TRỰC TIẾP HỆ THỐNG QUA POSTMAN (5 PHÚT)
1. **Bước 1**: Đăng nhập với tài khoản Thu ngân (`POST /api/auth/login`). Cho hội đồng thấy Token trả về và Cookie `HttpOnly` được gán tự động.
2. **Bước 2**: Tra cứu sản phẩm bằng Barcode (`GET /api/product/barcode/8934567890123`), hiển thị tồn kho hiện tại (ví dụ: còn 50 lon nước ngọt).
3. **Bước 3**: Lập hóa đơn (`POST /api/invoice`) mua 5 lon nước ngọt kèm số điện thoại khách hàng. Cho thấy hệ thống tính chiết khấu điểm và trừ tồn kho ngay lập tức (còn 45 lon).
4. **Bước 4**: Thanh toán đơn hàng qua VNPay (`POST /api/payment/process`), sinh ra URL thanh toán VNPay Sandbox.
5. **Bước 5**: Giả lập Webhook IPN từ VNPay xác nhận thanh toán thành công, kiểm tra lại hóa đơn đã đổi sang `PAID` và điểm khách hàng được cộng thêm.
6. **Bước 6**: Đăng nhập tài khoản Chủ cửa hàng (`STORE_OWNER`), gọi API báo cáo doanh thu và tải về file Excel báo cáo thực tế.

### ⏱️ PHẦN 5: KẾT LUẬN & HƯỚNG PHÁT TRIỂN (1 PHÚT)
- Tóm tắt kết quả đạt được: Hoàn thành 100% các API cốt lõi, đạt chuẩn bảo mật và hiệu năng.
- Hướng mở rộng: Tích hợp AI gợi ý sản phẩm bán kèm, mở rộng bán hàng đa kênh (Omnichannel) kết nối Shopee/Tiki.

---

# CHƯƠNG 8: BỘ CÂU HỎI PHẢN BIỆN CỦA HỘI ĐỒNG & CÂU TRẢ LỜI MẪU (Q&A)

### Câu hỏi 1: Tại sao nhóm lại chọn xây dựng bằng Jakarta Servlet thuần kết hợp Hibernate mà không dùng Spring Boot?
- **Trả lời**:  
  *"Thưa Thầy/Cô, việc chọn Jakarta Servlet API 6.0 kết hợp với Hibernate 6 thuần là chủ đích của nhóm nhằm nắm vững bản chất cốt lõi của công nghệ: hiểu rõ cách Servlet Container (Tomcat) xử lý luồng Request, cơ chế hoạt động của Filter và vòng đời của Session. Ngoài ra, việc không dùng toàn bộ Framework cồng kềnh như Spring Boot giúp ứng dụng có dung lượng artifact rất nhẹ (file .war gọn nhẹ), thời gian khởi động (Startup time) cực nhanh và mức tiêu thụ RAM thấp hơn đáng kể, rất phù hợp khi triển khai trên các hệ thống tài nguyên tối ưu như Docker Container trên Cloud."*

### Câu hỏi 2: Hệ thống xử lý thế nào đối với bài toán tranh chấp dữ liệu (Concurrency / Race Condition) khi nhiều thu ngân cùng bán một sản phẩm sắp hết hàng?
- **Trả lời**:  
  *"Thưa Thầy/Cô, nhóm đã giải quyết vấn đề này ở tầng Database Transaction. Khi tạo hóa đơn, tầng Service thực thi trong một Transaction có mức cô lập (Isolation Level) đảm bảo tính toàn vẹn. Nhóm kiểm tra `stockQuantity >= requestedQuantity` và thực hiện câu lệnh cập nhật có điều kiện tại Database:  
  `UPDATE product SET stock_quantity = stock_quantity - ? WHERE product_id = ? AND stock_quantity >= ?`.  
  Nếu câu lệnh trả về 0 dòng bị ảnh hưởng, Hibernate sẽ ném ngoại lệ và kích hoạt Rollback toàn bộ hóa đơn, thông báo ngay cho thu ngân là sản phẩm vừa bị khách khác mua hết, ngăn chặn hoàn toàn hiện tượng âm kho."*

### Câu hỏi 3: Tại sao nhóm lưu Refresh Token vào HttpOnly Cookie thay vì lưu ở LocalStorage như Access Token?
- **Trả lời**:  
  *"Thưa Thầy/Cô, đây là tiêu chuẩn bảo mật phòng chống tấn công XSS (Cross-Site Scripting). Nếu lưu Refresh Token ở LocalStorage của trình duyệt, nếu website bị chèn mã độc JavaScript từ bên thứ ba, hacker có thể đánh cắp Refresh Token và duy trì phiên đăng nhập vĩnh viễn. Khi gán cờ `HttpOnly` và `Secure`, mã JavaScript hoàn toàn không thể đọc được giá trị cookie này, chỉ có trình duyệt mới tự động gửi cookie khi gọi API `/api/auth/refresh`, giúp bảo vệ tài khoản người dùng tuyệt đối."*

### Câu hỏi 4: Khi khách hàng đổi trả hàng, hệ thống có thu hồi điểm tích lũy đã cộng cho hóa đơn đó không?
- **Trả lời**:  
  *"Thưa Thầy/Cô, trong thiết kế module `ReturnReceipt`, khi khách hàng hoàn trả một phần hoặc toàn bộ hàng hóa, hệ thống tính toán chính xác số tiền hoàn trả (`refundAmount`). Dựa trên số tiền này, hệ thống thực thi trừ lại số điểm thưởng tương ứng đã cộng trước đó từ tài khoản của khách hàng, đảm bảo sự công bằng và chống hành vi trục lợi điểm thưởng."*

### Câu hỏi 5: Nếu cổng VNPay bị lỗi mạng hoặc gửi lặp lại Webhook IPN thì hệ thống xử lý ra sao?
- **Trả lời**:  
  *"Thưa Thầy/Cô, nhóm đã áp dụng nguyên lý Idempotency (tính lũy đẳng) trong việc xử lý Webhook. Khi nhận được request IPN từ VNPay, hệ thống kiểm tra chữ ký số SHA-512 để xác thực nguồn gốc từ VNPay. Sau đó kiểm tra trạng thái hiện tại của đơn hàng: Nếu hóa đơn đã ở trạng thái `PAID`, hệ thống chỉ trả về mã phản hồi thành công `RspCode: 00` cho VNPay mà không thực hiện lại các thao tác nghiệp vụ (như cộng điểm hay thay đổi tồn kho). Điều này đảm bảo dù VNPay có gửi lại webhook 10 lần thì hệ thống vẫn không bị sai lệch số liệu."*

---
*Tài liệu này được biên soạn phục vụ đồ án môn Công nghệ phần mềm - Nhóm 7 (2026).*
