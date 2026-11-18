là một công cụ dùng để chuyển một chuỗi văn bản thành các token ID 
có nhiều loại tokenizer khác nhau
- word-based: mỗi từ là một [[Token]], [[Vocabulary]] sẽ phình rất to, dễ gặp hiện tượng [[OOV]] 
- charater-based: mỗi kí tự là một token, giải quyết triệt để [[OOV]] dễ bị mất thông tin ngữ nghĩa do các từ đơn lẻ không mang ý nghĩa
- subword-based: là một cách chia kiểu "unhappy" -> \["un", "happy"], đây là tokenizer được sử dụng trong các LLM hiện đại 