# TÀI LIỆU VÀ KỊCH BẢN THUYẾT TRÌNH CHUYÊN SÂU
## MODULE BÁO CÁO DOANH THU, KIỂM KÊ KHO & XUẤT EXCEL (REPORT MODULE)
**Đề tài**: Hệ thống Quản lý Siêu thị Mini (Convenience Store Backend RESTful API)  
**Học phần**: Công nghệ phần mềm (Software Engineering)  
**Tác giả báo cáo**: Trương Anh Kiệt (MSSV: 24110267) - Nhóm 7  
**Công nghệ hiện thực**: Java 17, Jakarta Servlet 6.0, Hibernate 6.5 JPA, PostgreSQL, Apache POI (Excel XSSFWorkbook)  

---

# PHẦN 1: TỔNG QUAN VỊ TRÍ & VAI TRÒ CỦA MODULE REPORT

### 1.1 Vị trí "Bộ não ra quyết định" (Executive Decision Support)
Nếu như Module Hóa đơn (`Invoice`) và Nhập hàng (`PurchaseReceipt`) là đôi tay thu thập và vận hành dữ liệu, thì **Module Báo cáo (`Report`)** chính là **Bộ não phân tích và hỗ trợ ra quyết định kinh doanh (Business Intelligence & Analytics)** cho ban quản lý siêu thị:

```
┌────────────────────────────────────────────────────────────────────────┐
│                          DỮ LIỆU ĐẦU VÀO (INCOMING DATA)               │
│                                                                        │
│   • Hóa đơn bán hàng PAID (Invoice)       • Giao dịch tiền mặt & VNPay │
│   • Phiếu nhập hàng (PurchaseReceipt)     • Phiếu đổi trả hoàn tiền    │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        MODULE BÁO CÁO (REPORT ENGINE)                  │
├───────────────────────────────────┬────────────────────────────────────┤
│     1. BÁO CÁO DOANH THU          │     2. KIỂM KÊ & ĐỐI SOÁT KHO      │
│  • Doanh thu thuần (Net Revenue)  │  • Đối soát: Tồn máy vs Thực tế   │
│  • Phân bổ Tiền mặt vs VNPay      │  • Phân loại: SHORTAGE, SURPLUS    │
│  • Timeline theo Giờ/Ngày/Tháng   │  • Biên bản kiểm kê định kỳ        │
├───────────────────────────────────┴────────────────────────────────────┤
│     3. KẾT XUẤT DỮ LIỆU ĐỘNG SANG EXCEL BẰNG APACHE POI (.XLSX)        │
│  • Báo cáo nhập hàng NCC          • Báo cáo kiểm kê & xuất hủy kho     │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        ĐỐI TƯỢNG HƯỞNG LỢI                             │
│   • STORE_OWNER: Nắm bắt sức khỏe tài chính & doanh số tức thời.       │
│   • INVENTORY_MANAGER: Phát hiện thất thoát và xử lý hàng hỏng/hết date│
└────────────────────────────────────────────────────────────────────────┘
```

---

# PHẦN 2: THIẾT KẾ KIẾN TRÚC & CÁC THÀNH PHẦN MÃ NGUỒN

Module được xây dựng theo kiến trúc phân tầng độc lập, xử lý từ truy vấn dữ liệu lớn đến kết xuất binary file:

1. **Controller Layer (`ReportController.java`)**:
   - Định tuyến các endpoint:
     - `GET /api/report/revenue`: Báo cáo doanh thu tài chính theo ngày/tháng/năm/khoảng thời gian.
     - `GET /api/report/export-excel`: Xuất file Excel chuẩn OpenXML (MIME: `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`).
     - `POST /api/report/stock-discrepancy`: Lập biên bản kiểm kê kho.
     - `GET /api/report/stock-discrepancy`: Lấy danh sách biên bản kiểm kê có phân trang và bộ lọc.
     - `GET /api/report/stock-discrepancy/:id`: Lấy chi tiết từng mặt hàng trong biên bản kiểm kê.
   - Kiểm soát quyền hạn: Chỉ nhân viên có vai trò `STORE_OWNER` hoặc `INVENTORY_MANAGER` mới được truy cập.
2. **Service Layer (`ReportService.java`)**:
   - `calculateDateRange`: Chuẩn hóa và tự động suy luận khoảng thời gian (`from`, `to`) theo tham số người dùng (`day`, `month`, `year`, `custom`).
   - Xử lý nghiệp vụ kiểm kê: Đối soát `difference = actualQuantity - systemQuantity`, tự động gán nhãn `SHORTAGE` (thiếu), `SURPLUS` (thừa), `MATCH` (khớp).
   - Điều phối luồng xuất file Excel qua `ReportExcelExporter`.
3. **Repository Layer (`RevenueRepository.java` & `ReportRepository.java`)**:
   - `RevenueRepository`: Chuyên trách các câu lệnh tổng hợp tài chính phức tạp:
     - Tính tổng doanh thu gốc, tổng chiết khấu điểm, tổng tiền hoàn trả đổi trả để ra **Doanh thu thuần (`netRevenue`)**.
     - Tổng hợp phân loại phương thức thanh toán (`CASH` vs `ONLINE`).
     - Gom nhóm theo mốc thời gian động bằng hàm `TO_CHAR(created_at, :pattern)`.
   - `ReportRepository`: Quản lý lưu trữ biên bản kiểm kê (`InventoryReport`, `InventoryReportDetail`) đảm bảo tính ACID.
4. **Excel Exporter Engine (`ReportExcelExporter.java`)**:
   - Ứng dụng thư viện **Apache POI (XSSFWorkbook)**.
   - Định dạng bảng tính tiêu chuẩn kế toán: Tiêu đề trang trọng, header màu xanh Navy chữ trắng, viền ô mỏng, căn lề chuẩn, định dạng tiền tệ `#,##0 "đ"` và dòng tính tổng cộng in đậm.

---

# PHẦN 3: BA TÍNH NĂNG NGHIỆP VỤ CỐT LÕI

### 3.1 Báo cáo Doanh thu Đa chiều (GET `/api/report/revenue`)
- **Công thức tính Doanh thu Thuần (Net Revenue)**:
  $$\text{Net Revenue} = \text{Original Total} - \text{Discount Amount} - \text{Total Refund}$$
  - $\text{Original Total}$: Tổng tiền hàng niêm yết bán ra từ các hóa đơn `PAID`.
  - $\text{Discount Amount}$: Số tiền đã chiết khấu bằng điểm thưởng khách hàng.
  - $\text{Total Refund}$: Tổng số tiền đã hoàn trả lại cho khách khi có đổi trả hàng hợp lệ ([ReturnReceipt](file:///home/kiettruong/Documents/Obsidian/4.Rarely_See/University/3rd%20HK1/Cong_nghe_phan_mem/market/QuanLySieuThi/src/main/java/com/mycompany/quanlysieuthi/modules/returnreceipt/ReturnReceiptService.java)).
- **Cơ cấu Dòng tiền**: Tách bạch rõ số tiền thu bằng **Tiền mặt (CASH)** và qua **VNPay QR / Chuyển khoản (ONLINE)** giúp chủ cửa hàng đối soát tiền mặt trong két với tiền chuyển về tài khoản ngân hàng.
- **Biểu đồ Dòng thời gian (Timeline Trend)**:
  - Xem theo Ngày (`type=day`): Nhóm theo từng giờ (`HH24:00`), giúp xác định **khung giờ vàng đông khách nhất** để bố trí nhân sự thu ngân.
  - Xem theo Tháng (`type=month`): Nhóm theo từng ngày (`YYYY-MM-DD`), thấy rõ ngày nào doanh thu đột biến.
  - Xem theo Năm (`type=year`): Nhóm theo từng tháng (`YYYY-MM`), hỗ trợ hoạch định chiến lược kinh doanh cả năm.

### 3.2 Kiểm kê Kho & Phát hiện Thất thoát (Stock Discrepancy Audit)
- **Quy trình kiểm kê thực tế**:
  1. Thủ kho quét mã kiểm kê và nhập số lượng thực tế đếm được trên kệ (`actualQuantity`).
  2. Hệ thống đọc số lượng tồn ghi nhận trên phần mềm (`systemQuantity`).
  3. Tính toán độ lệch:
     - `difference < 0` $\rightarrow$ Trạng thái `SHORTAGE` (Mất mát, hàng hỏng chưa xuất hủy, hoặc rơi vỡ).
     - `difference > 0` $\rightarrow$ Trạng thái `SURPLUS` (Nhập hàng quên ghi sổ, hoặc khách thanh toán nhầm).
     - `difference = 0` $\rightarrow$ Trạng thái `MATCH` (Khớp tồn kho 100%).
  4. Lưu biên bản kiểm kê với mã `KK...`, gửi báo cáo đến Chủ cửa hàng xem xét phê duyệt cân đối kho.

### 3.3 Xuất Báo cáo Excel Chuyên nghiệp bằng Apache POI (GET `/api/report/export-excel`)
- Không phải file CSV đơn giản, mà là file **Microsoft Excel chuẩn (`.xlsx`)**:
  - Tự động định dạng số tiền có dấu phân cách hàng nghìn (`#,##0 "đ"`).
  - Tự động tính toán tổng số lượng và tổng thành tiền ở dòng chân trang (`TỔNG CỘNG`).
  - Hỗ trợ xuất 2 phân hệ: **Báo cáo Nhập hàng Nhà cung cấp** và **Báo cáo Kiểm kê - Xuất hủy hàng hỏng**.

---

# PHẦN 4: KỊCH BẢN THUYẾT TRÌNH BẢO VỆ ĐỒ ÁN (7 - 10 PHÚT)

### ⏱️ Slide 1: Đặt vấn đề & Tầm quan trọng của Module Report (1 phút)
- **Lời nói gợi ý**:
  > *"Kính thưa Thầy/Cô trong Hội đồng và các bạn. Sau khi hệ thống vận hành trơn tru các luồng Nhập kho, Bán hàng và Thanh toán, bài toán quan trọng nhất đặt ra cho người quản lý là: **Làm sao nắm bắt được sức khỏe tài chính của siêu thị và kiểm soát thất thoát hàng hóa một cách minh bạch?**  
  > Hôm nay em xin đại diện nhóm trình bày về **Module Báo cáo, Kiểm kê kho và Xuất Excel (Report Module)**. Đây là module đóng vai trò trung tâm hỗ trợ ra quyết định (Business Intelligence), biến toàn bộ dữ liệu giao dịch thành các chỉ số kinh doanh giá trị cho Chủ cửa hàng và Thủ kho."*

### ⏱️ Slide 2: Kiến trúc Kỹ thuật & Các chỉ số tài chính cốt lõi (2 phút)
- **Lời nói gợi ý**:
  > *"Về mặt kiến trúc, Module Báo cáo tổng hợp dữ liệu từ 3 thực thể lớn: Hóa đơn bán hàng, Giao dịch thanh toán và Phiếu đổi trả.  
  > Điểm sáng nghiệp vụ của nhóm là công thức tính **Doanh thu thuần (Net Revenue)**: không chỉ đơn giản là cộng tổng hóa đơn, mà hệ thống tự động khấu trừ số tiền chiết khấu điểm tích lũy và số tiền hoàn trả khi khách đổi hàng.  
  > Bên cạnh đó, hệ thống phân tách rõ ràng cơ cấu dòng tiền giữa Tiền mặt tại quầy và Tiền chuyển khoản qua cổng VNPay, giúp kế toán đối soát chéo sổ quỹ mà không bị chênh lệch."*

### ⏱️ Slide 3: Phân tích Xu hướng & Đối soát Kiểm kê Kho (2 phút)
- **Lời nói gợi ý**:
  > *"Hệ thống hỗ trợ phân tích timeline đa tầng: Xem theo giờ trong ngày để phát hiện khung giờ cao điểm, xem theo ngày trong tháng và theo tháng trong năm. Nhóm tối ưu hóa câu truy vấn bằng hàm TO_CHAR của PostgreSQL gom nhóm trực tiếp tại Database, cho tốc độ xử lý hàng nghìn hóa đơn chỉ trong vài mili-giây.  
  > Về quản lý kho, tính năng Kiểm kê định kỳ (Stock Discrepancy) cho phép Thủ kho nhập số lượng đếm thực tế. Hệ thống tự động so khớp với tồn máy và gắn cờ cảnh báo: SHORTAGE nếu thiếu hụt hàng, SURPLUS nếu thừa kho, ghi nhận biên bản kiểm kê để ban quản lý có biện pháp xử lý kịp thời."*

### ⏱️ Slide 4: Kết xuất Báo cáo Excel bằng Apache POI (1.5 phút)
- **Lời nói gợi ý**:
  > *"Một tính năng rất thực tế mà các chủ siêu thị yêu cầu là xuất dữ liệu sang bảng tính Excel để nộp báo cáo thuế và lưu trữ nội bộ. Nhóm đã tích hợp thư viện **Apache POI**, xây dựng engine `ReportExcelExporter` tạo ra file `.xlsx` chuẩn OpenXML.  
  > File Excel xuất ra được thiết kế trang trọng với Header màu xanh navy, định dạng tiền tệ VND tự động, công thức tính tổng cộng và căn chỉnh độ rộng cột thông minh, sẵn sàng để in ấn ngay mà không cần chỉnh sửa lại."*

### ⏱️ Slide 5: Demo trực tiếp Postman & Kết luận (2.5 phút)
- Thực hiện demo trực tiếp theo kịch bản ở Mục 5 bên dưới.

---

# PHẦN 5: KỊCH BẢN DEMO THỰC CHIẾN TRÊN POSTMAN

1. **Bước 1 - Đăng nhập quyền Chủ cửa hàng (`STORE_OWNER`)**:
   - Gửi `POST /api/auth/login` với tài khoản `admin` / `123456`.
2. **Bước 2 - Lấy báo cáo doanh thu ngày hiện tại**:
   - Gửi `GET /api/report/revenue?type=day` (hoặc `type=month&month=10&year=2026`).
   - Cho Hội đồng xem kết quả JSON trả về:
     - `netRevenue` được tính tự động sau khi trừ chiết khấu và hoàn tiền.
     - `paymentMethodBreakdown` hiển thị rành mạch tiền mặt vs online.
     - `timeline` hiển thị doanh thu chia theo từng khung giờ/ngày.
3. **Bước 3 - Tạo biên bản kiểm kê kho phát hiện lệch hàng**:
   - Gửi `POST /api/report/stock-discrepancy` với body:
     ```json
     {
       "auditTitle": "Kiểm kê định kỳ kệ bánh kẹo",
       "items": [{ "productId": "SP000001", "actualQuantity": 45, "reason": "Bể hỏng 5 lon do rơi rớt" }]
     }
     ```
   - Nhận phản hồi `201 CREATED`, hệ thống gắn nhãn `SHORTAGE`, độ lệch `-5`.
4. **Bước 4 - Tải file Excel báo cáo**:
   - Gửi `GET /api/report/export-excel?target=DISCREPANCY&filterType=MONTHLY&month=10&year=2026`.
   - Postman tải về file `.xlsx`. Mở trực tiếp file Excel trên máy cho Hội đồng thấy giao diện bảng tính được định dạng màu sắc, kẻ viền và tính tổng chuyên nghiệp.

---

# PHẦN 6: BỘ CÂU HỎI PHẢN BIỆN CỦA HỘI ĐỒNG & CÂU TRẢ LỜI MẪU (Q&A)

### ❓ Câu hỏi 1: Tại sao công thức tính doanh thu của nhóm lại phải trừ đi cả tiền chiết khấu và tiền hoàn trả (Return Receipt)?
- **Trả lời**:  
  *"Thưa Thầy/Cô, đây là nguyên tắc kế toán tài chính thực tế:  
  1. **Tiền chiết khấu (Discount Amount)**: Là giá trị khuyến mãi hoặc điểm thưởng hội viên quy đổi ra tiền mà siêu thị giảm cho khách, tiền này không thực thu về két.  
  2. **Tiền hoàn trả (Total Refund)**: Khi khách mang hàng trả lại, siêu thị đã hoàn lại tiền mặt cho khách. Nếu không trừ khoản này, doanh thu báo cáo sẽ bị thổi phồng ảo (Over-stated Revenue).  
  Do đó, công thức `Net Revenue = Original Total - Discount - Refund` phản ánh chính xác 100% dòng tiền thực tế siêu thị thu được."*

### ❓ Câu hỏi 2: Khi cơ sở dữ liệu có hàng trăm nghìn hóa đơn, việc gọi API báo cáo doanh thu có bị chậm hoặc treo máy chủ không? Nhóm đã tối ưu truy vấn như thế nào?
- **Trả lời**:  
  *"Thưa Thầy/Cô, nhóm đã tối ưu hóa hiệu năng theo 3 cách:  
  1. **Đẩy toàn bộ tính toán về Database (Database Aggregation)**: Thay vì kéo hàng nghìn Entity Invoice lên RAM của máy chủ Tomcat rồi dùng vòng lặp Java để cộng tiền, nhóm sử dụng trực tiếp các hàm tổng hợp `COUNT`, `SUM`, `CASE WHEN` và `TO_CHAR` của PostgreSQL. Database chỉ xử lý trên bộ nhớ đĩa và trả về duy nhất một dòng kết quả tổng hợp.  
  2. **Tận dụng B-Tree Index**: Cột `status` và `created_at` trong bảng `invoice` và `payment` được đánh chỉ mục (Index), giúp phạm vi tìm kiếm theo ngày tháng đạt độ phức tạp $O(\log N)$ thay vì quét toàn bảng (Full Table Scan).  
  3. **Tách biệt báo cáo tổng hợp và chi tiết**: Giao diện chỉ tải bảng tóm tắt và timeline; khi người dùng cần xem chi tiết mới gọi phân trang `LIMIT ... OFFSET`, giúp tốc độ phản hồi luôn đạt dưới 100ms."*

### ❓ Câu hỏi 3: Tại sao nhóm không dùng file CSV cho nhẹ mà lại chọn dùng thư viện Apache POI để xuất file Excel (.xlsx)?
- **Trả lời**:  
  *"Thưa Thầy/Cô, file CSV tuy nhẹ nhưng có rất nhiều nhược điểm đối với nghiệp vụ bán lẻ thực tế:  
  1. CSV không lưu được định dạng màu sắc, không kẻ được khung viền và không thể tự động căn chỉnh độ rộng cột.  
  2. Khi mở bằng Microsoft Excel ở các máy tính có thiết lập vùng (Locale) khác nhau, tiếng Việt có dấu rất dễ bị lỗi font (encoding UTF-8 BOM) và định dạng số phân cách thập phân dễ bị hiểu sai.  
  3. Với **Apache POI**, nhóm tạo ra file Excel chuẩn OpenXML, có sẵn tiêu đề trang trọng, định dạng tiền tệ VND rõ ràng, màu sắc phân biệt và dòng tính tổng cộng chuyên nghiệp, người quản lý có thể in ra ký duyệt hoặc nộp báo cáo thuế ngay lập tức."*

### ❓ Câu hỏi 4: Khi kiểm kê phát hiện hàng bị thiếu hụt (SHORTAGE), hệ thống có tự động trừ tồn kho của sản phẩm đó trong cơ sở dữ liệu không?
- **Trả lời**:  
  *"Thưa Thầy/Cô, hệ thống **tuyệt đối không tự động thay đổi tồn kho** ngay khi lập biên bản kiểm kê.  
  Về mặt nguyên tắc quản trị kho: Biên bản kiểm kê (`InventoryReport`) chỉ là tài liệu ghi nhận sự chênh lệch tại thời điểm kiểm tra. Để điều chỉnh tồn kho vật lý của sản phẩm, quy trình bắt buộc phải có sự phê duyệt của Chủ cửa hàng (`STORE_OWNER`). Sau khi được duyệt, hệ thống sẽ liên kết sang Module **Phiếu xuất hủy (`DisposalReceipt`)** để xuất hủy hàng hư hỏng với lý do cụ thể, bảo đảm nguyên tắc kiểm soát chéo và chống gian lận trong kho."*

### ❓ Câu hỏi 5: Nếu người dùng không truyền tham số ngày tháng thì API báo cáo doanh thu sẽ mặc định lấy theo khoảng thời gian nào?
- **Trả lời**:  
  *"Thưa Thầy/Cô, trong tầng `ReportService`, nhóm đã xây dựng hàm `calculateDateRange` có cơ chế suy luận thông minh (Smart Fallback):  
  - Nếu không truyền tham số nào, hệ thống mặc định hiểu là `type=month` và tự động lấy từ ngày đầu tháng đến cuối tháng của tháng hiện tại (`LocalDate.now()`).  
  - Nếu truyền ngày (`date`), hệ thống lấy từ 00:00:00 đến 23:59:59 của ngày đó.  
  - Nhờ cơ chế này, Client gọi API rất đơn giản mà không bao giờ gặp lỗi thiếu tham số thời gian."*
