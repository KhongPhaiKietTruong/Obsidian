## Định Nghĩa 
Encoder là một thành phần nằm trong các kiến trúc model, dùng để đọc dữ liệu đầu vào và biến nó thành các [[Embeddings]] 

có nhiều loại encoder khác nhau
- Transformer encoder: gồm hai lớp chính là [[Multi-Head Attention]] và một feed-forward [[Neural Network]] và các lớp phụ Add & Norm (được dùng mỗi lần sau lớp chính)
![[Pasted image 20260922150315.png]]
add chính là [[Residual Block]] (skip-connection) và norm chính là [[Batch Norm Layer]]