/**
 * report_template.js
 * Mẫu dựng file Word (.docx) chuẩn báo cáo tiếng Việt:
 * - Khổ A4, font Times New Roman 13pt
 * - Giãn dòng 1.5, lề Trái 3cm, Phải 2cm, Trên 2cm, Dưới 2cm (chuẩn Việt Nam)
 * - Heading cấp 1 (14pt Bold), Heading cấp 2 (13pt Bold)
 * - Bảng: Tiêu đề cột đậm, nền xám nhạt, ShadingType.CLEAR, cantSplit: true
 * - Đánh số trang căn giữa ở Footer
 */

const fs = require("fs");
const {
  Document,
  Packer,
  Paragraph,
  TextRun,
  HeadingLevel,
  AlignmentType,
  Table,
  TableRow,
  TableCell,
  WidthType,
  BorderStyle,
  Header,
  Footer,
  PageNumber,
  ShadingType
} = require("docx");

// 1 cm = 567 DXA
const CM = 567;
const PAGE_WIDTH_A4 = 11906; // 21 cm
const MARGIN_LEFT = 3 * CM;  // 3 cm đóng gáy
const MARGIN_RIGHT = 2 * CM; // 2 cm
const MARGIN_TOP = 2 * CM;   // 2 cm
const MARGIN_BOTTOM = 2 * CM;// 2 cm
const CONTENT_WIDTH = PAGE_WIDTH_A4 - MARGIN_LEFT - MARGIN_RIGHT; // ~9072 DXA

function createStandardReport({ title, subtitle, author, date, sections }) {
  const doc = new Document({
    creator: author || "Sinh viên",
    title: title || "Báo Cáo Học Phần",
    description: subtitle || "",
    styles: {
      default: {
        document: {
          run: {
            font: "Times New Roman",
            size: 26, // 13pt (half-points)
            color: "000000",
          },
          paragraph: {
            spacing: {
              line: 360, // 1.5 line spacing (240 is 1.0)
              before: 120,
              after: 120,
            },
            alignment: AlignmentType.JUSTIFIED,
          },
        },
      },
    },
    sections: [
      {
        properties: {
          page: {
            size: {
              width: PAGE_WIDTH_A4,
              height: 16838, // 29.7 cm A4
            },
            margin: {
              top: MARGIN_TOP,
              bottom: MARGIN_BOTTOM,
              left: MARGIN_LEFT,
              right: MARGIN_RIGHT,
            },
          },
        },
        footers: {
          default: new Footer({
            children: [
              new Paragraph({
                alignment: AlignmentType.CENTER,
                children: [
                  new TextRun({
                    children: [PageNumber.CURRENT],
                    font: "Times New Roman",
                    size: 20, // 10pt
                  }),
                ],
              }),
            ],
          }),
        },
        children: [
          // Tiêu đề báo cáo
          new Paragraph({
            alignment: AlignmentType.CENTER,
            spacing: { before: 200, after: 100 },
            children: [
              new TextRun({
                text: title.toUpperCase(),
                bold: true,
                size: 32, // 16pt
                font: "Times New Roman",
              }),
            ],
          }),
          ...(subtitle ? [
            new Paragraph({
              alignment: AlignmentType.CENTER,
              spacing: { after: 300 },
              children: [
                new TextRun({
                  text: subtitle,
                  italics: true,
                  size: 24, // 12pt
                  font: "Times New Roman",
                }),
              ],
            })
          ] : []),
          // Thân bài từ các sections...
        ],
      },
    ],
  });

  return doc;
}

module.exports = {
  createStandardReport,
  CM,
  CONTENT_WIDTH,
};
