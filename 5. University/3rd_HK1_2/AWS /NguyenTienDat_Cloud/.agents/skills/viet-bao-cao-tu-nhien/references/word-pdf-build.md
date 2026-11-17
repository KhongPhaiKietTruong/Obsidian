# Dựng file Word và PDF cho báo cáo tiếng Việt

Đọc SKILL.md của skill `docx` (hoặc `pdf`) trước khi viết code. File này chỉ bổ sung phần riêng cho báo cáo tiếng Việt.

## Chọn đường dựng

| Cần | Cách làm |
|---|---|
| Chỉ Word | Dựng bằng docx-js. Xuất phát từ `scripts/report_template.js` |
| Chỉ PDF, hoặc cả hai | Dựng .docx trước, rồi đổi sang PDF: `python /mnt/skills/public/docx/scripts/office/soffice.py --headless --convert-to pdf file.docx`. Một nguồn, hai định dạng, không lệch nhau |
| PDF có bố cục đặc biệt mà Word khó làm | reportlab, làm theo mục "PDF bằng reportlab" bên dưới |
| Người dùng đưa file Word có sẵn để sửa | Sửa đúng file đó theo skill `docx`, không dựng lại |

Nội dung viết bằng Markdown thì đổi bằng pandoc (`pandoc in.md -o out.docx`), rồi kiểm tra không còn ký tự Markdown bằng `scripts/lint_slop.py`.

## Mặc định cho báo cáo tiếng Việt

Dùng khi người dùng không có mẫu riêng. Có mẫu của trường, công ty thì theo mẫu.

- Khổ A4.
- Font Times New Roman 13pt cho thân bài (báo cáo doanh nghiệp có thể Arial hoặc Calibri 11pt). Word trên máy người dùng sẽ dùng đúng font; khi render trong container, Liberation Serif thay thế và có cùng độ rộng chữ nên bố cục khớp.
- Giãn dòng 1.5, thụt đầu dòng 1 cm, căn đều hai bên.
- Lề trái 3 cm (chừa đóng gáy), phải 2 cm, trên và dưới 2 cm. Đơn vị DXA: 1 cm = 567.
- Số trang ở giữa chân trang.
- Heading đậm, cỡ 14pt cho cấp 1 và 13pt cho cấp 2. Đánh số mục (1, 1.1) nếu văn bản trên 5 trang.
- Bảng: tiêu đề cột đậm, nền xám nhạt, chú thích "Bảng N." đặt phía trên bảng. Hình: chú thích "Hình N." đặt phía dưới.
- Metadata: đặt tên tác giả và tiêu đề thật.

## Chỗ hay hỏng trong docx-js

Đã kiểm chứng trong `scripts/report_template.js`:
- Đặt cả `columnWidths` và `width` từng ô, dùng DXA, tổng bằng chiều rộng vùng chữ (A4 trừ hai lề).
- `ShadingType.CLEAR`, không dùng `SOLID`.
- Số trang bằng `PageNumber.CURRENT` trong Footer.
- Heading phải dùng `HeadingLevel`, style tùy chỉnh cần `outlineLevel` thì mục lục mới nhận.
- Tiêu đề không đứng mồ côi cuối trang: `keepNext: true`. Hàng bảng không bị cắt đôi: `cantSplit: true`.

## PDF bằng reportlab: bắt buộc đăng ký font Unicode

Font mặc định của reportlab (Helvetica, Times-Roman) không có đủ dấu tiếng Việt, chữ sẽ mất dấu hoặc thành ô đen. Luôn đăng ký font TTF:

```python
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.fonts import addMapping
d = "/usr/share/fonts/truetype/liberation/"
pdfmetrics.registerFont(TTFont("Serif", d + "LiberationSerif-Regular.ttf"))
pdfmetrics.registerFont(TTFont("Serif-B", d + "LiberationSerif-Bold.ttf"))
pdfmetrics.registerFont(TTFont("Serif-I", d + "LiberationSerif-Italic.ttf"))
pdfmetrics.registerFont(TTFont("Serif-BI", d + "LiberationSerif-BoldItalic.ttf"))
addMapping("Serif", 0, 0, "Serif"); addMapping("Serif", 1, 0, "Serif-B")
addMapping("Serif", 0, 1, "Serif-I"); addMapping("Serif", 1, 0, "Serif-BI")
```

Sau đó đặt `fontName="Serif"` cho mọi ParagraphStyle, kể cả Title và Heading (style mặc định vẫn trỏ về Helvetica). Dùng A4 (`reportlab.lib.pagesizes.A4`), không phải letter. Thoát `&`, `<`, `>` trong nội dung Paragraph. Số trang thêm bằng `onFirstPage`/`onLaterPages` của `doc.build`. Không dùng ký tự Unicode chỉ số trên/dưới, dùng thẻ `<sub>`, `<super>`.

## Kiểm tra trước khi giao

1. Chạy `python scripts/lint_slop.py file.docx` (hoặc .pdf).
2. Render: `soffice.py --headless --convert-to pdf`, rồi `pdftoppm -jpeg -r 70 file.pdf page`, và xem từng ảnh. Tìm: mất dấu, ô đen, bảng tràn lề, tiêu đề mồ côi, trang trắng thừa, số trang sai.
3. Với PDF, `pdffonts file.pdf` phải cho thấy font chữ đã nhúng (emb = yes). Riêng Helvetica không nhúng là bình thường với reportlab, bỏ qua nếu không có chữ nào dùng nó.
4. Đối chiếu lại toàn bộ số liệu và trích dẫn với nguồn.
