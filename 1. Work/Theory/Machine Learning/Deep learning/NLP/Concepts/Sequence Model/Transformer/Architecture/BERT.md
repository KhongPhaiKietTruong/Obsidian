viết tắt của: Bidirectional Encoder Representation from Transformer 
![[Pasted image 20260924205606.png|284]]
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
trong quá trình huấn luyện, BERT được truyền vào một cặp câu (A, B), các từ trong câu sẽ được biến thành các [[Word Embeddings]], mỗi một embedding được cấu thành bởi 3 [[Vector]]: 
- Token: được tạo nên lúc pretrain trên tập dữ liệu tổng quát 
- Segment: từ này thuộc câu A hay B ?
- Position: vị trí của từ trong câu ![[Pasted image 20260924205845.png]]
và output ra giá trị dự đoán phù hợp với hai mục tiêu ta nói ở trên (1 hoặc 0 và 2 câu văn) (hai mục tiêu của ta được train **đồng thời**)
## Finetune
thực hiện thay thế lớp cuối của BERT thành các lớp để phù hợp với yêu cầu bài toán hiện tại rồi train trên tập dữ liệu chuyên biệt 

