# TÀI LIỆU VÀ KỊCH BẢN THUYẾT TRÌNH CHUYÊN SÂU
## MODULE HÓA ĐƠN & BÁN HÀNG TẠI QUẦY (INVOICE MODULE)
**Đề tài**: Hệ thống Quản lý Siêu thị Mini (Convenience Store Backend RESTful API)  
**Học phần**: Công nghệ phần mềm (Software Engineering)  
**Tác giả báo cáo**: Trương Anh Kiệt (MSSV: 24110267) - Nhóm 7  
**Công nghệ hiện thực**: Java 17, Jakarta Servlet 6.0, Hibernate 6.5 JPA, PostgreSQL, JUnit 5 & Mockito  

---

# PHẦN 1: TỔNG QUAN VỊ TRÍ & VAI TRÒ CỦA MODULE INVOICE

### 1.1 Vị trí "Trái tim" trong hệ sinh thái siêu thị mini
Trong kiến trúc phần mềm quản lý bán lẻ, **Module Hóa đơn (`Invoice`)** được định vị là **module nghiệp vụ trung tâm (Core Business Engine)**, kết nối và đồng bộ trạng thái của 5 phân hệ khác nhau:

```
                      ┌───────────────────────────┐
                      │   Product / Inventory     │
                      │ (Quản lý Tồn kho & Giá)   │
                      └─────────────┬─────────────┘
                                    │ (Trừ kho / Hoàn kho)
                                    ▼
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│     Customer     │ ◄─── │  INVOICE MODULE  │ ───► │     Payment      │
│ (Tích & Tiêu Đổi)│      │  (Bán hàng POS)  │      │ (Tiền mặt, VNPay)│
└──────────────────┘      └─────────┬────────┘      └──────────────────┘
                                    │
                                    │ (Hóa đơn PAID làm căn cứ)
                                    ▼
                          ┌──────────────────┐
                          │  Return Receipt  │
                          │   & Báo cáo DT   │
                          └──────────────────┘
```

1. **Với Phân hệ Hàng hóa (Product & Inventory)**: Tự động khóa và trừ số lượng tồn kho theo thời gian thực (Real-time Inventory Deduction) ngay khi lập đơn tại quầy POS, ngăn chặn hiện tượng bán âm kho.
2. **Với Phân hệ Khách hàng (Customer Loyalty Program)**: Xử lý bài toán kép: Khấu trừ điểm thưởng để giảm giá trực tiếp trên hóa đơn, hoặc tích lũy điểm thưởng theo tỷ lệ doanh số nếu không dùng điểm.
3. **Với Phân hệ Thanh toán (Payment Gateway & Cash)**: Cung cấp số tiền thanh toán cuối cùng (`finalTotal`) và quản lý vòng đời trạng thái đơn hàng (`PENDING` $\rightarrow$ `PAID` / `CANCELLED`).
4. **Với Phân hệ Đổi trả hàng (Return Receipt)**: Đóng vai trò là chứng từ pháp lý gốc, kiểm tra tính hợp lệ của mặt hàng, đơn giá mua thực tế và số lượng tối đa được phép trả lại.
5. **Với Phân hệ Báo cáo (Report & Analytics)**: Dữ liệu hóa đơn `PAID` là nguồn dữ liệu chuẩn (Single Source of Truth) để kết xuất doanh thu, lợi nhuận và xuất file Excel.

---

# PHẦN 2: THIẾT KẾ KIẾN TRÚC & MÔ HÌNH DỮ LIỆU

### 2.1 Kiến trúc phân tầng (Clean Layered Architecture)
Module được tổ chức nghiêm ngặt theo mô hình 4 tầng độc lập, giảm độ kết dính (Low Coupling) và tăng tính gắn kết (High Cohesion):

1. **Controller Layer (`InvoiceController.java`)**:
   - Định tuyến các HTTP Request (`POST`, `GET`, `DELETE`) trên URL `/api/invoice` và `/api/invoice/*`.
   - Trích xuất thông tin nhân viên thu ngân tự động từ JWT Token (`getCurrentEmployeeId`, `getCurrentFullName`) thông qua context claims bảo mật, không cho phép Client tự truyền ID nhân viên nhằm chống gian lận.
   - Thừa hưởng cơ chế bắt ngoại lệ tập trung (`BaseController`), tự động ánh xạ các Business Exception thành chuẩn HTTP Code (201, 200, 400, 404, 409, 422).
2. **Service Layer (`InvoiceService.java`)**:
   - Chứa 100% nghiệp vụ bán hàng: Xác thực tính hợp lệ của giỏ hàng, kiểm tra ngưỡng tồn kho, quy đổi điểm thưởng Loyalty, tính toán tiền hàng bằng `BigDecimal` tránh lỗi sai số dấu phẩy động.
   - Sinh mã định danh tự động theo quy ước (`IdGenerator`: `HD...`, `CTHD...`).
3. **Repository Layer (`InvoiceRepository.java`)**:
   - Trực tiếp quản lý `EntityManager` và `EntityTransaction` ở chế độ Resource-Local.
   - Đảm bảo tính toàn vẹn giao dịch (ACID): Nhóm thao tác trừ kho nhiều sản phẩm + cập nhật điểm khách + lưu hóa đơn + lưu chi tiết vào một khối Transaction duy nhất.
   - Thực thi Native Query tối ưu hóa phân trang (`LIMIT ... OFFSET ...`) và các phép `JOIN` dữ liệu.
4. **DTO Layer (`InvoiceRequest.java`, `InvoiceResponse.java`)**:
   - Sử dụng tính năng **Java Records (Java 17+)** bất biến (Immutable), ngăn chặn triệt để lỗi biến đổi trạng thái ngoài ý muốn (Side-effect).

### 2.2 Sơ đồ Cơ sở dữ liệu Thực thể (Entity Relationship)

```
┌─────────────────────────────────┐                 ┌──────────────────────────────────────┐
│        TABLE: invoice           │                 │        TABLE: invoice_detail         │
├─────────────────────────────────┤ 1             * ├──────────────────────────────────────┤
│ PK  invoice_id      VARCHAR(36) │◄────────────────│ PK  invoice_detail_id    VARCHAR(36) │
│ FK  customer_id     VARCHAR(36) │                 │ FK  invoice_id           VARCHAR(36) │
│ FK  employee_id     VARCHAR(36) │                 │ FK  product_id           VARCHAR(36) │
│     status          VARCHAR(30) │                 │     quantity             INTEGER     │
│     original_total  NUMERIC     │                 │     unit_price           NUMERIC     │
│     discount_amount NUMERIC     │                 │     subtotal             NUMERIC     │
│     created_at      TIMESTAMP   │                 └──────────────────────────────────────┘
└─────────────────────────────────┘
```

- Bảng `invoice`: Lưu trữ thông tin đơn hàng tổng thể, trạng thái (`PENDING`, `PAID`, `CANCELLED`), tiền gốc (`original_total`), tiền giảm (`discount_amount`) và thời điểm tạo.
- Bảng `invoice_detail`: Lưu trữ từng dòng mặt hàng trong hóa đơn, ghi nhận giá bán tại thời điểm mua (`unit_price`) để bảo toàn tính lịch sử nếu sau này giá niêm yết của sản phẩm thay đổi.

---

# PHẦN 3: CÁC NGHIỆP VỤ CỐT LÕI (CORE BUSINESS RULES)

### 3.1 Nghiệp vụ 1: Lập hóa đơn POS & Quản lý tồn kho tức thời (POST `/api/invoice`)
- **Luồng xử lý**:
  1. Thu ngân gửi giỏ hàng gồm danh sách mã sản phẩm và số lượng.
  2. Hệ thống tổng hợp số lượng cần xuất theo từng mã sản phẩm (`stockDeductions`). Nếu một sản phẩm xuất hiện nhiều dòng trong request, hệ thống tự động gộp số lượng để kiểm tra.
  3. Kiểm tra tồn kho: `if (product.getStockQuantity() < neededQty)` $\rightarrow$ Lập tức ném `IllegalArgumentException` thông báo rõ tên mặt hàng và số lượng hiện có.
  4. Mở `EntityTransaction`: Trừ số lượng tồn kho của từng sản phẩm tương ứng, ghi nhận `Invoice` với trạng thái ban đầu là `PENDING`.
- **Lý do thiết kế `PENDING` và trừ kho ngay**:
  - Tại quầy POS, khi thu ngân đã quét sản phẩm vào hóa đơn, hàng hóa vật lý đã được bỏ vào túi cho khách. Nếu không trừ kho ngay, một quầy thu ngân khác có thể cùng bán sản phẩm này, dẫn đến hiện tượng bán vượt số lượng thực có trên quầy.

### 3.2 Nghiệp vụ 2: Chính sách Điểm thưởng Thành viên (Loyalty Rules)
Hệ thống hỗ trợ 2 kịch bản linh hoạt cho khách hàng thành viên:
1. **Kịch bản Khấu trừ điểm giảm giá (`useLoyaltyPoints = true`)**:
   - Quy đổi: **1 điểm = 1 VNĐ**.
   - Giới hạn bảo vệ: Tối đa **100,000 điểm/hóa đơn** (tránh gian lận hoặc cạn điểm đột ngột) và không được vượt quá tổng giá trị hóa đơn (`originalTotal`).
   - Điểm của khách hàng bị trừ ngay tại thời điểm lập đơn: `customer.setLoyaltyPoints(current - pointsToUse)`.
   - Số tiền phải trả: `finalTotal = originalTotal - discountAmount`.
2. **Kịch bản Tích lũy điểm mới (`useLoyaltyPoints = false` hoặc không có điểm giảm)**:
   - Tỷ lệ tích điểm: Cứ mỗi **10,000 VNĐ** chi tiêu, hội viên nhận **100 điểm** thưởng (tương đương hoàn tiền 1% doanh số).
   - Công thức: `earnedPoints = floor(originalTotal / 10000) * 100`.
   - Điểm mới được cộng ngay vào tài khoản khách hàng.

### 3.3 Nghiệp vụ 3: Hủy hóa đơn & Cơ chế bù trừ trạng thái (DELETE `/api/invoice/:id`)
- **Điều kiện tiên quyết**: Chỉ cho phép hủy các hóa đơn đang ở trạng thái `PENDING` (khách hàng đổi ý không mua hoặc không đủ tiền thanh toán). Nếu hóa đơn đã `PAID` thì bắt buộc phải đi qua quy trình Đổi trả (`Return Receipt`).
- **Cơ chế Hoàn trả (Compensating Transaction)**:
  1. **Hoàn kho**: Đọc toàn bộ `InvoiceDetail` của hóa đơn, cộng trả lại số lượng từng món vào kho (`stockQuantity = stockQuantity + qty`).
  2. **Hoàn/Thu hồi điểm thành viên**:
     - Nếu đơn hàng có sử dụng điểm giảm giá: Hoàn trả lại toàn bộ số điểm đã khấu trừ vào tài khoản khách.
     - Nếu đơn hàng đã được cộng điểm tích lũy: Thu hồi lại đúng số điểm đã cộng trước đó (`customer.setLoyaltyPoints(max(0, current - pointsEarned))`).
  3. Cập nhật trạng thái hóa đơn sang `CANCELLED`.
  4. Toàn bộ chuỗi thao tác này được thực thi trong một `EntityTransaction` an toàn tuyệt đối.

---

# PHẦN 4: KỊCH BẢN THUYẾT TRÌNH BẢO VỆ ĐỒ ÁN (7 - 10 PHÚT)

### ⏱️ Slide 1: Giới thiệu Module & Tầm quan trọng (1 phút)
- **Lời nói gợi ý**:
  > *"Kính thưa Thầy/Cô trong Hội đồng và các bạn. Hôm nay em xin đại diện nhóm báo cáo chuyên sâu về **Module Hóa đơn (Invoice Module)** của Hệ thống Quản lý Siêu thị Mini.  
  > Trong hoạt động bán lẻ tại quầy POS, hóa đơn không chỉ đơn thuần là phiếu in tính tiền, mà chính là nút thắt trung tâm kiểm soát tính toàn vẹn của tồn kho, chính sách điểm thưởng khách hàng và doanh thu của siêu thị. Module Invoice do nhóm thiết kế giải quyết triệt để bài toán: Xử lý giỏ hàng nhanh, trừ tồn kho an toàn, tính toán chiết khấu điểm tự động và sẵn sàng hoàn kho khi hủy đơn."*

### ⏱️ Slide 2: Kiến trúc Kỹ thuật & Các nguyên lý thiết kế (1.5 phút)
- **Điểm nhấn trên slide**:
  - Mô hình Layered: `InvoiceController` $\rightarrow$ `InvoiceService` $\rightarrow$ `InvoiceRepository` $\rightarrow$ PostgreSQL.
  - Sử dụng **Java 17 Records** định nghĩa DTO bất biến, sạch sẽ.
  - Tự động bắt lỗi tập trung (`BaseController`) chuyển đổi thành mã chuẩn HTTP (201 Created, 400 Bad Request, 404 Not Found, 422 Unprocessable Entity).
  - Trích xuất định danh nhân viên thu ngân từ JWT Claims, không nhận ID từ Body để đảm bảo an ninh.
- **Lời nói gợi ý**:
  > *"Về mặt kiến trúc, module được xây dựng theo mô hình phân tầng chặt chẽ. Điểm nhấn là nhóm sử dụng Java Records hiện đại cho tầng DTO giúp dữ liệu không bị đột biến (Immutable). Tầng Controller kế thừa BaseController có cơ chế Centralized Exception Handling tự động, bắt toàn bộ lỗi nghiệp vụ và lỗi ràng buộc dữ liệu mà tuyệt đối không để vỡ ứng dụng với mã lỗi 500."*

### ⏱️ Slide 3: Luồng Nghiệp vụ Tạo Đơn & Cơ chế Transaction ACID (2.5 phút)
- **Điểm nhấn trên slide**:
  - Sơ đồ Sequence Diagram khi gọi `POST /api/invoice`.
  - Cơ chế Double-Check tồn kho trước khi ghi dữ liệu.
  - Hai kịch bản Loyalty: Khấu trừ tối đa 100,000 điểm hoặc tích lũy 1% doanh số.
  - Thực thi trong `EntityTransaction` đơn nhất với khối rollback tự động.
- **Lời nói gợi ý**:
  > *"Khi nhân viên thu ngân quét các món hàng và tạo hóa đơn qua POST /api/invoice, tầng Service sẽ kiểm tra giỏ hàng. Nếu khách chọn nhiều dòng cùng một mã hàng, hệ thống tự động gộp số lượng cần trừ. Nếu bất kỳ món nào không đủ tồn kho, hệ thống lập tức chặn lại và báo rõ tên sản phẩm kèm số lượng tồn còn lại.  
  > Nếu hợp lệ, hệ thống tính toán giá tiền bằng BigDecimal. Với khách hàng thành viên, hệ thống xử lý khấu trừ điểm thưởng minh bạch với hạn mức 100.000 điểm/đơn, hoặc cộng điểm mới nếu không chiết khấu. Toàn bộ thao tác trừ tồn kho, cập nhật điểm và tạo hóa đơn được bọc trong một Database Transaction duy nhất. Nếu có bất kỳ sự cố kết nối nào, toàn bộ dữ liệu sẽ được Rollback về trạng thái ban đầu, cam kết không bao giờ bị lệch kho."*

### ⏱️ Slide 4: Nghiệp vụ Hủy Đơn An Toàn (Compensating Mechanism) (1.5 phút)
- **Điểm nhấn trên slide**:
  - Endpoint `DELETE /api/invoice/:id`.
  - Quy tắc chỉ cho phép hủy hóa đơn trạng thái `PENDING`.
  - Cơ chế bồi hoàn tự động: Hoàn trả số lượng vào kho + Hoàn trả điểm đã tiêu / Thu hồi điểm đã tích.
- **Lời nói gợi ý**:
  > *"Một tính năng rất quan trọng trong bán lẻ là xử lý khi khách hàng hủy đơn tại quầy do thiếu tiền hoặc đổi ý. Với endpoint DELETE /api/invoice/:id, hệ thống áp dụng cơ chế Compensating Transaction: kiểm tra nếu hóa đơn đang là PENDING thì mới cho phép hủy. Hệ thống sẽ tự động quét danh sách chi tiết để hoàn trả 100% số lượng sản phẩm về lại kho và hoàn trả hoặc thu hồi điểm tích lũy của khách hàng một cách chính xác tuyệt đối."*

### ⏱️ Slide 5: Kiểm thử Đảm bảo chất lượng (Quality Assurance) (1.5 phút)
- **Điểm nhấn trên slide**:
  - 13 Test Cases bao phủ toàn diện trong file `InvoiceServiceTest.java`.
  - Sử dụng JUnit 5 kết hợp Mockito Mocking tầng Repository.
  - Kiểm thử đầy đủ các nhánh rẽ: Request rỗng, thiếu mã sản phẩm, số lượng <= 0, không đủ tồn kho, khách vãng lai, khách thành viên, dùng điểm vượt tổng tiền, hủy đơn thành công và hủy đơn không hợp lệ.
- **Lời nói gợi ý**:
  > *"Để đảm bảo chất lượng phần mềm, nhóm đã xây dựng bộ Unit Test độc lập với 13 ca kiểm thử bằng JUnit 5 và Mockito. Tỷ lệ bao phủ kiểm thử của tầng Service đạt trên 95%, đảm bảo mọi tình huống lỗi ngoại lệ hay tính toán tiền tệ phức tạp đều được kiểm soát chặt chẽ trước khi triển khai."*

### ⏱️ Slide 6: Demo trực tiếp Postman & Kết luận (2 phút)
- **Các bước thao tác Postman**:
  1. Mở Postman $\rightarrow$ Chọn Request `6.1 Create Invoice POS` $\rightarrow$ Send $\rightarrow$ Nhận mã `201 CREATED`, hóa đơn sinh ra ID `HD...` ở trạng thái `PENDING`.
  2. Mở CSDL hoặc gọi `GET /api/product/:id` để chứng minh tồn kho đã được trừ ngay.
  3. Gọi `DELETE /api/invoice/:id` $\rightarrow$ Hóa đơn chuyển `CANCELLED` $\rightarrow$ Gọi lại sản phẩm chứng minh tồn kho đã được hoàn lại đầy đủ.

---

# PHẦN 5: BỘ CÂU HỎI PHẢN BIỆN CỦA HỘI ĐỒNG & CÂU TRẢ LỜI MẪU (Q&A)

### Câu hỏi 1: Tại sao hệ thống lại trừ số lượng tồn kho ngay khi tạo hóa đơn (trạng thái PENDING) thay vì chờ khách thanh toán thành công (PAID) mới trừ?
- **Trả lời**:  
  *"Thưa Thầy/Cô, đây là quyết định thiết kế xuất phát từ nghiệp vụ bán lẻ thực tế tại siêu thị (POS Check-out):  
  Khi nhân viên thu ngân bấm tạo hóa đơn, các món hàng vật lý đã nằm trên bàn cân hoặc giỏ thanh toán của khách. Nếu chúng ta chờ đến khi thanh toán xong mới trừ kho, trong khoảng thời gian khách mở app ngân hàng quét VNPay (có thể mất 1 - 2 phút), các quầy thu ngân khác vẫn nhìn thấy số tồn kho cũ và có thể tiếp tục bán cho khách khác. Điều này sẽ dẫn đến lỗi bán vượt số lượng thực tế (Over-selling / Bán âm kho).  
  Do đó, nhóm chọn giải pháp **Lock inventory tạm thời** bằng cách trừ kho ngay khi tạo hóa đơn `PENDING`. Nếu giao dịch thanh toán thất bại hoặc khách đổi ý hủy đơn, hệ thống có sẵn cơ chế bồi hoàn `cancelInvoice` để hoàn trả lại số lượng vào kho ngay lập tức."*

### Câu hỏi 2: Nếu hai quầy thu ngân cùng quét một sản phẩm chỉ còn tồn kho 1 cái và cùng bấm tạo hóa đơn trong cùng một phần nghìn giây thì hệ thống xử lý tranh chấp (Concurrency / Race Condition) thế nào?
- **Trả lời**:  
  *"Thưa Thầy/Cô, nhóm xử lý bài toán Concurrency ở tầng Database Transaction. Khi Service gọi `saveInvoice`, toàn bộ logic kiểm tra và trừ kho được thực thi bên trong một `EntityTransaction`.  
  Cụ thể, trong khối `tx.begin()`, câu lệnh đọc và cập nhật `product.setStockQuantity(stock - qty)` được thực thi. Ở mức độ cơ sở dữ liệu quan hệ PostgreSQL, khi một transaction cập nhật một dòng dữ liệu của bảng `product`, hệ thống sẽ giữ khóa dòng (Row-level Lock).  
  Quầy thu ngân nào gửi request trước sẽ hoàn tất việc trừ kho (tồn kho về 0). Quầy thu ngân thứ hai khi vào transaction sẽ thấy tồn kho hiện tại bằng 0, điều kiện `if (product.getStockQuantity() < neededQty)` sẽ kích hoạt ngoại lệ `IllegalArgumentException: Sản phẩm không đủ tồn kho` và Transaction của quầy thứ hai lập tức bị Rollback, đảm bảo không thể xảy ra hiện tượng âm kho."*

### Câu hỏi 3: Tại sao trong `InvoiceRepository`, nhóm lại dùng Native SQL Query trong hàm `findInvoices` và `findInvoiceDetailById` mà không dùng JPQL hoặc JPA Criteria?
- **Trả lời**:  
  *"Thưa Thầy/Cô, có hai lý do chính nhóm lựa chọn Native SQL Query cho các thao tác truy vấn danh sách và chi tiết:  
  1. **Hiệu năng và Tối ưu phân trang**: Khi hiển thị danh sách hóa đơn, chúng ta chỉ cần các trường cần thiết của Hóa đơn kết hợp tên Nhân viên và tên Khách hàng. Nếu dùng JPQL ánh xạ toàn bộ Entity quan hệ (`@ManyToOne`, `@OneToMany`) dễ gặp phải vấn nạn **N+1 Query Problem** hoặc sinh ra các câu lệnh SQL cồng kềnh với nhiều bảng không cần thiết.  
  2. **Kiểm soát linh hoạt các bộ lọc động**: Với Native Query, nhóm có thể dễ dàng ghép chuỗi linh hoạt các điều kiện lọc theo ngày giờ, mã khách hàng, mã nhân viên và trạng thái cùng từ khóa `LIMIT ... OFFSET ...` chuẩn xác theo dialect của PostgreSQL, giúp câu lệnh thực thi nhanh hơn rất nhiều."*

### Câu hỏi 4: Khi khách hàng đã thanh toán xong (`PAID`), nếu thu ngân bấm gọi API `DELETE /api/invoice/:id` thì chuyện gì sẽ xảy ra?
- **Trả lời**:  
  *"Thưa Thầy/Cô, hệ thống sẽ từ chối thao tác và ném ra ngoại lệ `IllegalStateException: Hóa đơn đã ở trạng thái PAID (chỉ cho phép hủy hóa đơn PENDING)`. Tầng BaseController sẽ bắt ngoại lệ này và trả về mã lỗi `400 BAD REQUEST` cho Client.  
  Về mặt nghiệp vụ kế toán, một hóa đơn đã thanh toán là chứng từ tài chính hợp pháp, thu ngân tuyệt đối không được phép tùy tiện xóa hay hủy bỏ. Nếu khách muốn trả hàng lấy lại tiền, quy trình bắt buộc phải thông qua module Đổi trả hàng (`Return Receipt`), có lý do trả hàng rõ ràng và lập phiếu hoàn tiền tương ứng."*

### Câu hỏi 5: Điểm thưởng Loyalty được tính toán như thế nào, và làm sao ngăn chặn việc khách hàng bị trừ điểm âm hoặc dùng điểm nhiều hơn giá trị đơn hàng?
- **Trả lời**:  
  *"Thưa Thầy/Cô, nhóm đã cài đặt 3 tầng kiểm soát chặt chẽ trong `InvoiceService`:  
  1. **Tầng 1 - Kiểm tra điểm khả dụng**: `pointsToUse = Math.min(currentPoints, maxAllowed)` với `maxAllowed = 100,000` điểm (tương đương tối đa giảm 100.000 VNĐ cho mỗi hóa đơn).  
  2. **Tầng 2 - Capped theo giá trị đơn**: `pointsToUse = Math.min(pointsToUse, originalTotal.intValue())`. Điều này bảo đảm số tiền giảm giá không bao giờ lớn hơn tổng tiền hàng (tránh hóa đơn bị âm tiền).  
  3. **Tầng 3 - Cập nhật điểm đồng thời**: Điểm mới của khách được tính toán chính xác và cập nhật chung trong cùng một `EntityTransaction` với hóa đơn. Nếu có lỗi lưu hóa đơn, điểm của khách cũng tự động được hoàn lại mà không bị mất mát."*
