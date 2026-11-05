#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script tạo file Word (.docx) chuyên nghiệp từ ThuyetTrinh_Module_Invoice.md
"""

import os
import zipfile
import xml.sax.saxutils as saxutils

output_path = "/home/kiettruong/Documents/Obsidian/4.Rarely_See/University/3rd HK1/Cong_nghe_phan_mem/ThuyetTrinh_Module_Invoice.docx"
md_path = "/home/kiettruong/Documents/Obsidian/4.Rarely_See/University/3rd HK1/Cong_nghe_phan_mem/ThuyetTrinh_Module_Invoice.md"

with open(md_path, 'r', encoding='utf-8') as f:
    md_content = f.read()

body_xml_parts = []

def esc(text):
    return saxutils.escape(text.strip())

# 1. Trang bìa tiêu đề
body_xml_parts.append("""
<w:p>
  <w:pPr><w:jc w:val="center"/><w:spacing w:before="600" w:after="160"/></w:pPr>
  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="28"/><w:color w:val="0D6EFD"/></w:rPr><w:t>TÀI LIỆU VÀ KỊCH BẢN THUYẾT TRÌNH CHUYÊN SÂU</w:t></w:r>
</w:p>
<w:p>
  <w:pPr><w:jc w:val="center"/><w:spacing w:after="240"/></w:pPr>
  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="38"/><w:color w:val="111827"/></w:rPr><w:t>MODULE HÓA ĐƠN &amp; BÁN HÀNG TẠI QUẦY (INVOICE)</w:t></w:r>
</w:p>
<w:p>
  <w:pPr><w:jc w:val="center"/><w:spacing w:after="400"/></w:pPr>
  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="26"/><w:color w:val="4B5563"/></w:rPr><w:t>(HỆ THỐNG QUẢN LÝ SIÊU THỊ MINI - BACKEND RESTFUL API)</w:t></w:r>
</w:p>
""")

# Bảng thông tin sinh viên & đề tài
body_xml_parts.append("""
<w:tbl>
  <w:tblPr>
    <w:tblW w:w="9200" w:type="dxa"/>
    <w:jc w:val="center"/>
    <w:tblBorders>
      <w:top w:val="single" w:sz="6" w:space="0" w:color="D1D5DB"/>
      <w:left w:val="single" w:sz="6" w:space="0" w:color="D1D5DB"/>
      <w:bottom w:val="single" w:sz="6" w:space="0" w:color="D1D5DB"/>
      <w:right w:val="single" w:sz="6" w:space="0" w:color="D1D5DB"/>
      <w:insideH w:val="single" w:sz="4" w:space="0" w:color="E5E7EB"/>
      <w:insideV w:val="single" w:sz="4" w:space="0" w:color="E5E7EB"/>
    </w:tblBorders>
  </w:tblPr>
  <w:tr>
    <w:tc><w:tcPr><w:tcW w:w="3000" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F3F4F6"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>Học phần:</w:t></w:r></w:p>
    </w:tc>
    <w:tc><w:tcPr><w:tcW w:w="6200" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="FFFFFF"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/></w:rPr><w:t>Công nghệ phần mềm (Software Engineering)</w:t></w:r></w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:tc><w:tcPr><w:tcW w:w="3000" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F3F4F6"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>Nhóm thực hiện:</w:t></w:r></w:p>
    </w:tc>
    <w:tc><w:tcPr><w:tcW w:w="6200" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="FFFFFF"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="0D6EFD"/></w:rPr><w:t>Nhóm 7</w:t></w:r></w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:tc><w:tcPr><w:tcW w:w="3000" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F3F4F6"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>Người thuyết trình:</w:t></w:r></w:p>
    </w:tc>
    <w:tc><w:tcPr><w:tcW w:w="6200" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="FFFFFF"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/></w:rPr><w:t>Trương Anh Kiệt (MSSV: 24110267)</w:t></w:r></w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:tc><w:tcPr><w:tcW w:w="3000" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F3F4F6"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>Công nghệ triển khai:</w:t></w:r></w:p>
    </w:tc>
    <w:tc><w:tcPr><w:tcW w:w="6200" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="FFFFFF"/><w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar></w:tcPr>
      <w:p><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/></w:rPr><w:t>Java 17 - Jakarta Servlet 6.0 - Hibernate 6.5 JPA - PostgreSQL - JUnit 5</w:t></w:r></w:p>
    </w:tc>
  </w:tr>
</w:tbl>
<w:p><w:pPr><w:spacing w:after="300"/></w:pPr></w:p>
""")

lines = md_content.split('\n')
i = 0
in_code = False
code_lines = []

while i < len(lines):
    line = lines[i]
    sline = line.strip()

    if sline.startswith('```'):
        if in_code:
            in_code = False
            code_runs = ''.join([f'<w:r><w:rPr><w:rFonts w:ascii="Consolas" w:hAnsi="Consolas"/><w:sz w:val="18"/><w:color w:val="24292E"/></w:rPr><w:t xml:space="preserve">{esc(cl)}</w:t></w:r><w:r><w:br/></w:r>' for cl in code_lines])
            body_xml_parts.append(f"""
            <w:tbl>
              <w:tblPr>
                <w:tblW w:w="9200" w:type="dxa"/>
                <w:jc w:val="center"/>
                <w:tblBorders>
                  <w:top w:val="single" w:sz="4" w:space="0" w:color="E1E4E8"/>
                  <w:left w:val="single" w:sz="18" w:space="0" w:color="0D6EFD"/>
                  <w:bottom w:val="single" w:sz="4" w:space="0" w:color="E1E4E8"/>
                  <w:right w:val="single" w:sz="4" w:space="0" w:color="E1E4E8"/>
                </w:tblBorders>
              </w:tblPr>
              <w:tr>
                <w:tc>
                  <w:tcPr>
                    <w:tcW w:w="9200" w:type="dxa"/>
                    <w:shd w:val="clear" w:color="auto" w:fill="F6F8FA"/>
                    <w:tcMar><w:top w:w="120" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="120" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar>
                  </w:tcPr>
                  <w:p><w:pPr><w:spacing w:after="0"/></w:pPr>{code_runs}</w:p>
                </w:tc>
              </w:tr>
            </w:tbl>
            <w:p><w:pPr><w:spacing w:after="100"/></w:pPr></w:p>
            """)
            code_lines = []
        else:
            in_code = True
            code_lines = []
        i += 1
        continue

    if in_code:
        code_lines.append(line)
        i += 1
        continue

    # Tiêu đề # H1
    if sline.startswith('# '):
        text = esc(sline[2:])
        body_xml_parts.append(f"""
        <w:p>
          <w:pPr><w:spacing w:before="360" w:after="120"/></w:pPr>
          <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="30"/><w:color w:val="0D6EFD"/></w:rPr><w:t>{text}</w:t></w:r>
        </w:p>
        """)
    # Tiêu đề ## H2
    elif sline.startswith('## '):
        text = esc(sline[3:])
        body_xml_parts.append(f"""
        <w:p>
          <w:pPr><w:spacing w:before="240" w:after="80"/></w:pPr>
          <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="25"/><w:color w:val="1F2937"/></w:rPr><w:t>{text}</w:t></w:r>
        </w:p>
        """)
    # Tiêu đề ### H3
    elif sline.startswith('### '):
        text = esc(sline[4:])
        body_xml_parts.append(f"""
        <w:p>
          <w:pPr><w:spacing w:before="180" w:after="60"/></w:pPr>
          <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="23"/><w:color w:val="B45309"/></w:rPr><w:t>{text}</w:t></w:r>
        </w:p>
        """)
    # Danh sách gạch đầu dòng
    elif sline.startswith('- ') or sline.startswith('* '):
        bullet_text = sline[2:].strip()
        if '**' in bullet_text:
            parts = bullet_text.split('**')
            if len(parts) >= 3 and bullet_text.startswith('**'):
                p_bold = esc(parts[1])
                p_rest = esc(''.join(parts[2:]))
                body_xml_parts.append(f"""
                <w:p>
                  <w:pPr><w:ind w:left="360"/><w:spacing w:after="60"/></w:pPr>
                  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="0D6EFD"/></w:rPr><w:t>• </w:t></w:r>
                  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:sz w:val="22"/><w:color w:val="111827"/></w:rPr><w:t>{p_bold} </w:t></w:r>
                  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>{p_rest}</w:t></w:r>
                </w:p>
                """)
            else:
                body_xml_parts.append(f"""
                <w:p>
                  <w:pPr><w:ind w:left="360"/><w:spacing w:after="60"/></w:pPr>
                  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="0D6EFD"/></w:rPr><w:t>• </w:t></w:r>
                  <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>{esc(bullet_text)}</w:t></w:r>
                </w:p>
                """)
        else:
            body_xml_parts.append(f"""
            <w:p>
              <w:pPr><w:ind w:left="360"/><w:spacing w:after="60"/></w:pPr>
              <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="0D6EFD"/></w:rPr><w:t>• </w:t></w:r>
              <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="374151"/></w:rPr><w:t>{esc(bullet_text)}</w:t></w:r>
            </w:p>
            """)
    elif sline.startswith('> '):
        quote_text = esc(sline[2:])
        body_xml_parts.append(f"""
        <w:tbl>
          <w:tblPr>
            <w:tblW w:w="9200" w:type="dxa"/>
            <w:jc w:val="center"/>
            <w:tblBorders>
              <w:top w:val="none"/>
              <w:left w:val="single" w:sz="24" w:space="0" w:color="0D6EFD"/>
              <w:bottom w:val="none"/>
              <w:right w:val="none"/>
            </w:tblBorders>
          </w:tblPr>
          <w:tr>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="9200" w:type="dxa"/>
                <w:shd w:val="clear" w:color="auto" w:fill="F0F7FF"/>
                <w:tcMar><w:top w:w="100" w:type="dxa"/><w:left w:w="160" w:type="dxa"/><w:bottom w:w="100" w:type="dxa"/><w:right w:w="160" w:type="dxa"/></w:tcMar>
              </w:tcPr>
              <w:p><w:pPr><w:spacing w:after="0"/></w:pPr><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:i/><w:sz w:val="22"/><w:color w:val="1E40AF"/></w:rPr><w:t>{quote_text}</w:t></w:r></w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <w:p><w:pPr><w:spacing w:after="80"/></w:pPr></w:p>
        """)
    elif not sline.startswith('---'):
        p_text = esc(sline)
        body_xml_parts.append(f"""
        <w:p>
          <w:pPr><w:spacing w:after="100"/><w:jc w:val="both"/></w:pPr>
          <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:sz w:val="22"/><w:color w:val="212529"/></w:rPr><w:t>{p_text}</w:t></w:r>
        </w:p>
        """)
    i += 1

content_types_xml = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
  <Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>
</Types>"""

rels_xml = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>"""

document_rels_xml = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
</Relationships>"""

styles_xml = """<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:docDefaults>
    <w:rPrDefault>
      <w:rPr>
        <w:rFonts w:ascii="Arial" w:eastAsia="Arial" w:hAnsi="Arial" w:cs="Arial"/>
        <w:sz w:val="22"/>
      </w:rPr>
    </w:rPrDefault>
  </w:docDefaults>
</w:styles>"""

document_xml = f"""<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    {''.join(body_xml_parts)}
    <w:sectPr>
      <w:pgSz w:w="11906" w:h="16838"/>
      <w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/>
    </w:sectPr>
  </w:body>
</w:document>"""

with zipfile.ZipFile(output_path, 'w', compression=zipfile.ZIP_DEFLATED) as zf:
    zf.writestr('[Content_Types].xml', content_types_xml)
    zf.writestr('_rels/.rels', rels_xml)
    zf.writestr('word/_rels/document.xml.rels', document_rels_xml)
    zf.writestr('word/styles.xml', styles_xml)
    zf.writestr('word/document.xml', document_xml)

print(f"DOCUMENT_CREATED_SUCCESSFULLY: {output_path} ({os.path.getsize(output_path)} bytes)")
