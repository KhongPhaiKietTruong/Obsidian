#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
lint_slop.py
Quét phát hiện văn phong 'AI slop' trong văn bản tiếng Việt:
- Từ ngữ sáo rỗng, khoa trương, ẩn dụ mòn
- Cấu trúc câu rập khuôn, liên từ lặp
- Ký tự emoji, Markdown lọt vào văn bản
- Bôi đậm quá mức hoặc lặp mẫu '**Tiêu đề:** mô tả'
"""

import sys
import os
import re
from collections import Counter

if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8")
        sys.stderr.reconfigure(encoding="utf-8")
    except Exception:
        pass

SLOP_WORDS = [
    # Nhấn mạnh rỗng & khoa trương
    "vô cùng", "cực kỳ", "đáng kể", "mạnh mẽ", "không ngừng", "ngày càng",
    "đột phá", "toàn diện", "đa chiều", "nâng tầm", "giải pháp toàn diện",
    "nền tảng vững chắc", "hệ sinh thái", "hành trình", "bức tranh toàn cảnh",
    "mở ra cánh cửa", "làn sóng", "kim chỉ nam", "chìa khóa", "sức mạnh",
    "đóng vai trò then chốt", "đóng vai trò quan trọng", "đóng vai trò quyết định",
    "không thể phủ nhận", "xu hướng tất yếu", "tầm quan trọng của",
    # Mở bài/kết bài sáo mòn
    "trong bối cảnh", "kỷ nguyên số", "công nghệ 4.0", "thời đại số",
    "tóm lại, có thể thấy rằng", "nhìn chung", "hy vọng bài viết",
    # Cụm liên từ dồn dập
    "bên cạnh đó", "hơn nữa", "ngoài ra", "đặc biệt là",
    "điều này cho thấy", "có thể thấy rằng", "cần lưu ý rằng", "đáng chú ý là"
]

REGEX_PATTERNS = [
    (r"không chỉ\b.*?\bmà còn\b", "Cấu trúc 'không chỉ... mà còn' lặp"),
    (r"đây không phải\b.*?\bmà là\b", "Cấu trúc tương phản giả 'đây không phải... mà là'"),
    (r"\b\d+%\b(?!\s*\(theo|\s*\[|\s*\(nguồn)", "Số liệu phần trăm không kèm nguồn trích dẫn")
]

# Emoji regex
EMOJI_PATTERN = re.compile(
    r"[\U0001F600-\U0001F64F"  # emoticons
    r"\U0001F300-\U0001F5FF"  # symbols & pictographs
    r"\U0001F680-\U0001F6FF"  # transport & map
    r"\U0001F1E0-\U0001F1FF"  # flags
    r"\U00002702-\U000027B0"
    r"\U000024C2-\U0001F251"
    r"\U0001F900-\U0001F9FF"  # supplemental symbols
    r"\U0001FA70-\U0001FAFF"
    r"]+",
    flags=re.UNICODE
)

def extract_text(file_path):
    ext = os.path.splitext(file_path)[1].lower()
    if ext in ['.txt', '.md', '.html']:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            return f.read()
    elif ext == '.docx':
        try:
            import docx
            doc = docx.Document(file_path)
            return "\n".join([p.text for p in doc.paragraphs])
        except ImportError:
            import zipfile
            import xml.etree.ElementTree as ET
            with zipfile.ZipFile(file_path) as z:
                xml_content = z.read('word/document.xml')
                tree = ET.fromstring(xml_content)
                texts = [node.text for node in tree.iter() if node.text]
                return " ".join(texts)
    elif ext == '.pdf':
        try:
            import pypdf
            reader = pypdf.PdfReader(file_path)
            return "\n".join([page.extract_text() or "" for page in reader.pages])
        except Exception:
            return ""
    else:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            return f.read()

def lint(content, file_path):
    print(f"=== BẮT ĐẦU QUÉT: {file_path} ===\n")
    issues = []
    
    # 1. Quét từ sáo
    content_lower = content.lower()
    found_words = {}
    for word in SLOP_WORDS:
        count = len(re.findall(r'\b' + re.escape(word) + r'\b', content_lower))
        if count > 0:
            found_words[word] = count
            
    if found_words:
        print("[!] Phát hiện từ sáo / AI buzzwords:")
        for w, c in sorted(found_words.items(), key=lambda x: -x[1]):
            print(f"  - '{w}': xuất hiện {c} lần")
        issues.append("slop_words")
    else:
        print("[OK] Không phát hiện từ ngữ sáo rỗng phổ biến.")

    # 2. Quét Emoji
    emojis = EMOJI_PATTERN.findall(content)
    if emojis:
        print(f"\n[!] Phát hiện {len(emojis)} emoji trong tài liệu: {set(emojis)}")
        print("  -> Khuyến nghị: Bỏ toàn bộ emoji trong văn bản học thuật/chuyên môn.")
        issues.append("emoji")
    else:
        print("[OK] Không có emoji.")

    # 3. Quét cấu trúc câu rập khuôn
    print("\n[*] Kiểm tra cấu trúc câu rập khuôn:")
    for pat, desc in REGEX_PATTERNS:
        matches = re.findall(pat, content, flags=re.IGNORECASE)
        if matches:
            print(f"  - {desc}: {len(matches)} lần (Ví dụ: {matches[0][:50]}...)")
            issues.append("pattern")

    # 4. Quét dấu gạch dài em-dash lạm dụng
    em_dashes = len(re.findall(r'—', content))
    if em_dashes > 5:
        print(f"\n[!] Phát hiện lạm dụng dấu gạch dài '—' ({em_dashes} lần). Nên thay bằng dấu phẩy hoặc chấm câu.")
        issues.append("em_dash")

    # 5. Quét mẫu '**Tiêu đề:** nội dung' lặp lại trong bullet
    bullet_bold_titles = len(re.findall(r'[-*]\s*\*\*[^*]+:\*\*', content))
    if bullet_bold_titles > 3:
        print(f"\n[!] Phát hiện {bullet_bold_titles} lần dùng mẫu '- **Tiêu đề:** mô tả'. Đây là đặc trưng của văn chat AI.")
        issues.append("bullet_bold_pattern")

    # 6. Đánh giá nhịp độ câu
    sentences = re.split(r'[.!?]+', content)
    words_per_sentence = [len(s.split()) for s in sentences if len(s.split()) > 3]
    if words_per_sentence:
        avg_len = sum(words_per_sentence) / len(words_per_sentence)
        variance = sum((l - avg_len) ** 2 for l in words_per_sentence) / len(words_per_sentence)
        print(f"\n[*] Độ dài trung bình câu: {avg_len:.1f} từ (Độ biến thiên phương sai: {variance:.1f})")
        if variance < 15 and len(words_per_sentence) > 10:
            print("  [!] Cảnh báo: Nhịp độ các câu quá đều nhau, thiếu sự đan xen câu ngắn/dài tự nhiên.")

    # 7. Quét mở ngoặc giải thích song ngữ kiểu 'Thuật ngữ (Dịch nghĩa)' hoặc '(ví dụ: ...)'
    vi_chars = set('àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐ')
    bilingual_parens = re.findall(r'([A-Za-z0-9\s]+)\s*\(([^)]{2,35})\)', content)
    suspicious_parens = []
    for before, inside in bilingual_parens:
        inside_clean = inside.strip()
        before_clean = before.strip().split()[-1] if before.strip() else ""
        has_vi_inside = any(c in vi_chars for c in inside_clean.lower())
        has_vi_before = any(c in vi_chars for c in before_clean.lower())
        if (has_vi_inside and not has_vi_before and len(before_clean) > 2) or (has_vi_before and not has_vi_inside and len(inside_clean.split()) <= 4):
            suspicious_parens.append(f"{before_clean} ({inside_clean})")
        elif inside_clean.lower().startswith('ví dụ:') or inside_clean.lower().startswith('tính theo:'):
            suspicious_parens.append(f"({inside_clean})")

    if suspicious_parens:
        print(f"\n[!] Phát hiện {len(suspicious_parens)} chỗ mở ngoặc giải thích song ngữ / chú thích thừa:")
        for sp in suspicious_parens[:10]:
            print(f"  - {sp}")
        if len(suspicious_parens) > 10:
            print(f"  ... và còn {len(suspicious_parens) - 10} chỗ khác.")
        print("  -> Khuyến nghị (Giải pháp 3): Dùng thẳng thuật ngữ chuyên ngành chuẩn hoặc dịch thuần Việt, bỏ ngoặc đơn giải thích lặp.")
        issues.append("bilingual_parens")
    else:
        print("[OK] Không phát hiện mở ngoặc giải thích song ngữ thừa thãi.")


    print("\n" + "="*40)
    if not issues:
        print("KẾT QUẢ: VĂN BẢN ĐẠT CHUẨN TỰ NHIÊN, KHÔNG CÓ DẤU HIỆU AI SLOP.")
    else:
        print(f"KẾT QUẢ: Phát hiện {len(issues)} điểm cần biên tập lại để văn phong tự nhiên hơn.")
    print("="*40)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Sử dụng: python lint_slop.py <file_path>")
        sys.exit(1)
    file_path = sys.argv[1]
    if not os.path.exists(file_path):
        print(f"File không tồn tại: {file_path}")
        sys.exit(1)
    content = extract_text(file_path)
    lint(content, file_path)
