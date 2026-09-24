viết tắt của: Bidirectional Encoder Representation from Transformer 

## Định Nghĩa
là một Encoder-Only Model được tạo bằng ghép nhiều encoder của [[Transformer]] lại 
BERT có thể học để hiểu được ngôn ngữ 

## Công Dụng
- phân loại văn bản 
- name enity recognition (NER)
- Question Awnsering 
- Semantic Similarity and Information Retrivial 
- Masked Language Modeling 

## 
## Pretraining 
trong pretraining của BERT sẽ có hai mục tiêu huấn luyện là MLM và NSP để trả lời BERT trả lời được hai câu hỏi: "ngôn ngữ là gì", "bối cảnh là gì"
- MLM (Masked Language Model): cho các từ xung quanh, dự đoán từ ở giữa 
- NSP (Next Sentence Prediction): xem xem câu tiếp theo có liên quan với câu ở phía trước không (dạng phân loại nhị phân)
trong quá trình huấn luyện, BERT được truyền vào một cặp câu (A, B) và output ra 
## Finetune
thực hiện thay thế lớp cuối của BERT thành các lớp để phù hợp với yêu cầu bài toán hiện tại rồi train trên tập dữ liệu chuyên biệt 

