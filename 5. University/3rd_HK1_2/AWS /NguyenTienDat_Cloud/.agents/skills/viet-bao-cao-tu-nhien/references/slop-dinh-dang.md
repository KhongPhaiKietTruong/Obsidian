# Lỗi định dạng làm văn bản trông như AI sinh

## Trong nội dung

- **Bôi đậm khắp nơi.** Tối đa 1-2 chỗ mỗi trang, dành cho thứ người đọc không được bỏ sót.
- **Gạch đầu dòng hóa mọi thứ.** Ý có quan hệ nhân quả hoặc điều kiện thì viết thành đoạn văn. Bullet cho các mục thật sự song song (danh sách yêu cầu, các bước).
- **Mẫu "**Tiêu đề:** mô tả" lặp ở mọi bullet.** Dấu hiệu nổi bật nhất của văn chat dán vào Word.
- **Heading cho đoạn 2-3 câu.** Báo cáo 1-2 trang không cần heading. Nếu dùng, heading nêu nội dung ("Chi phí vận hành tăng 22%") thay vì nhãn chung ("Phân tích").
- **Khung cố định "Tổng quan / Phân tích / Kết luận".** Chỉ dùng khi mẫu của trường/công ty bắt buộc.
- **Emoji làm icon đầu mục** (✅ 🚀 📌). Bỏ hết.
- **Dấu gạch dài (—) dày đặc.** Dùng dấu phẩy, dấu chấm hoặc tách câu.
- **Ngoặc đơn giải thích chen vào câu**, và ngoặc kép nhấn mạnh từ ("giải pháp", "chiến lược").
- **Bảng cho nội dung không cần so sánh.** Bảng chỉ khi nhiều mục theo cùng tiêu chí.

## Ký tự Markdown lọt vào file Word/PDF

Nội dung sinh ra thường ở dạng Markdown. Nếu dán thẳng, file sẽ có `**đậm**`, `### heading`, `---`, dấu backtick, `|---|` của bảng, `- ` đầu dòng. Chuyển đổi đúng (pandoc từ .md sang .docx, hoặc dựng bằng docx-js với style thật). Chạy `scripts/lint_slop.py` để bắt sót.

## Trình bày file

- Font, cỡ chữ, giãn dòng, căn lề nhất quán từ đầu đến cuối. Không trộn hai font thân bài.
- Có số trang. Trang bìa không cần đánh số nếu văn bản dài.
- Bảng và hình có số thứ tự và chú thích ("Bảng 2. Doanh thu theo quý"), và được nhắc trong thân bài.
- Không có heading mồ côi ở cuối trang hoặc bảng bị cắt đôi.
- Tiêu đề file, tác giả, ngày trong metadata không để mặc định ("Untitled", tên công cụ).
- Nguồn tham khảo theo một chuẩn duy nhất (APA, IEEE hoặc chuẩn của trường), không trộn.
