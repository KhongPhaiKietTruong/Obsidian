---
name: viet-bao-cao-tu-nhien
description: Viết báo cáo, bài tổng hợp, luận văn, tiểu luận, biên bản, đề xuất, bài tập lớn bằng tiếng Việt và xuất ra file Word (.docx) hoặc PDF mà đọc lên như người thật viết, không có "mùi AI". Dùng skill này bất cứ khi nào người dùng nhờ viết, tổng hợp, tóm tắt tài liệu thành báo cáo, hoặc muốn sửa văn bản trông máy móc/sáo rỗng/AI slop, kể cả khi họ không nói rõ "tránh giọng AI". Cũng dùng khi cần chuẩn hóa định dạng báo cáo Word/PDF (lề, font, số trang, đánh số bảng hình, tiếng Việt có dấu trong PDF). Dùng chung với skill docx hoặc pdf để dựng file.
---

# Viết báo cáo tự nhiên (Word/PDF)

Văn bản "mùi AI" lộ ra ở ba tầng: từ ngữ sáo rỗng, cấu trúc đều đặn quá mức, và nội dung không có chi tiết cụ thể. Sửa chữ không đủ. Phải viết từ dữ liệu thật và có quan điểm thật. Skill này dùng đúng thứ tự đó.

## Quy trình

1. **Chốt người đọc và quyết định.** Ai đọc, họ cần quyết định hoặc hiểu gì sau khi đọc? Viết thành 1 câu. Nếu người dùng chưa nói và không đoán được, hỏi 1 câu ngắn. Nếu có mẫu/template của trường hoặc công ty, làm theo mẫu đó thay cho mặc định ở `references/word-pdf-build.md`.
2. **Gom dữ liệu thật trước khi viết.** Số liệu, tên, ngày, nguồn, ví dụ từ tài liệu người dùng đưa hoặc từ tìm kiếm. Lý do: câu rỗng sinh ra khi người viết không có gì cụ thể để nói. Chỗ nào chưa có dữ liệu, ghi `[cần bổ sung]` chứ không tự bịa số hay nguồn.
3. **Dựng dàn ý ngược.** Bắt đầu từ kết luận và đề xuất, rồi mới xếp bằng chứng đỡ cho chúng. Đoạn đầu của báo cáo phải nêu thẳng phát hiện chính và việc cần làm. Không mở bài dẫn nhập.
4. **Viết nháp** theo nguyên tắc bên dưới.
5. **Cắt 20-30%.** Xóa mọi câu bỏ đi mà nghĩa không đổi. Nháp đầu gần như luôn thừa.
6. **Chạy linter** rồi sửa các chỗ nó chỉ ra:
   `python scripts/lint_slop.py <file.txt|.md|.docx|.pdf>`
   Linter bắt được từ sáo, Markdown lọt vào file, emoji, gạch dài dày đặc, nhịp câu đều. Nó không bắt được nội dung rỗng, việc đó tự kiểm bằng phép thử ở mục dưới.
7. **Dựng file.** Đọc `references/word-pdf-build.md`, sau đó đọc SKILL.md của skill `docx` (hoặc `pdf`) trước khi viết code.
8. **Render và nhìn tận mắt.** Chuyển sang ảnh, xem từng trang. Kiểm tra dấu tiếng Việt, số trang, bảng có bị tràn, ký tự lạ.

## Nguyên tắc viết

- **Kết luận trước, bằng chứng sau.** Người đọc bận sẽ dừng ở đoạn đầu. Đoạn đó phải đủ để họ hành động.
- **Mỗi đoạn có ít nhất 1 chi tiết cụ thể** (số, tên riêng, ví dụ, trích nguồn). Phép thử: thay tên đề tài bằng đề tài khác mà câu vẫn đúng thì câu đó rỗng, cắt hoặc viết lại.
- **Có quan điểm.** Báo cáo phải nói "nên chọn A vì X", không chỉ "A và B đều có ưu nhược điểm". Nếu thật sự chưa đủ dữ liệu để chốt, nói rõ thiếu gì.
- **Mỗi phát hiện kèm "vậy thì sao".** Hệ quả hoặc hành động, nếu không người đọc phải tự suy ra.
- **Câu ngắn, chủ động, từ thường ngày.** Trộn câu ngắn và dài. Đoạn 1 câu vẫn được. Không cần mọi đoạn dài bằng nhau.
- **Chỉ hedge khi thật sự không chắc**, và nói rõ chỗ nào chưa chắc và vì sao. Hedging rải đều làm người đọc không biết chỗ nào đáng tin.
- **Số có nguồn, hoặc không có số.** "Khoảng 70%" không nguồn là dấu hiệu bịa. Đối chiếu từng số và trích dẫn với nguồn gốc. Không kiểm chứng được thì bỏ.
- **Kết bài bằng việc cần làm tiếp**, không nhắc lại cả bài.
- **Không mở ngoặc giải thích song ngữ hay chú thích vụn vặt.** Dùng thẳng thuật ngữ chuẩn quốc tế (Region, Availability Zone, Edge Location, IaaS, PaaS, SaaS, CapEx, OpEx...) hoặc dùng tiếng Việt thuần tự nhiên. Tuyệt đối không chêm ngoặc đơn dịch nghĩa kiểu "Thuật ngữ (Dịch nghĩa)" hay nhồi nhét chú thích dài trong ngoặc.
- **Không khen người hỏi, không chào chèn, không "Hy vọng bài viết hữu ích".** Đó là văn chat, không phải văn báo cáo.

Danh sách đầy đủ các mẫu cần tránh nằm ở `references/slop-ngon-ngu.md` (từ, cấu trúc câu, giọng điệu) và `references/slop-dinh-dang.md` (định dạng). Đọc cả hai trước khi viết bản dài từ 2 trang trở lên. Với bài ngắn, các nguyên tắc ở trên là đủ.

## Định dạng, tóm tắt

Báo cáo 1-2 trang: không heading, văn xuôi, không bảng trừ khi so sánh nhiều mục theo cùng tiêu chí. Báo cáo dài hơn: heading theo nội dung thật (tên vấn đề, không phải "Tổng quan / Phân tích / Kết luận" chung chung), mục lục nếu trên 8 trang. Bôi đậm tối đa 1-2 chỗ mỗi trang. Không emoji. Gạch đầu dòng chỉ cho các mục thật sự song song.

## Khi người dùng đưa văn bản có sẵn để sửa

Đừng viết lại từ đầu. Chạy linter, đọc toàn bộ, sửa theo thứ tự: nội dung rỗng (thêm chi tiết hoặc cắt), cấu trúc (bỏ heading và bullet thừa), rồi mới đến từ ngữ. Giữ nguyên số liệu và nguồn của người dùng, nghi ngờ chỗ nào thì đánh dấu để họ kiểm, không tự sửa số.
