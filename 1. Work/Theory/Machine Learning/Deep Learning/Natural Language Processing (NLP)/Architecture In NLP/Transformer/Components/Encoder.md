## Định Nghĩa 
Encoder là một thành phần nằm trong kiến trúc model, dùng để đọc dữ liệu đầu vào (đọc từng [[Word Embeddings]]) và biến nó thành biểu diễn số ([[Activations In RNN (Hidden State)]]) 

có nhiều loại encoder khác nhau
- vanilla RNN encoder: ![[Pasted image 20260920140135.png]]
- GRU/LSTM: dùng [[GRU cell]], [[LSTM cell]] cell thay cho [[Vanilla RNN Cell]] trong vanilla RNN encoder (ảnh trên)
- Transformer encoder: gồm hai lớp chính là [[Multi-Head Attention]] và một feed-forward [[Neural Network (Mạng Neural)]] và các lớp phụ Add & Norm (được dùng mỗi lần sau lớp chính)
![[Pasted image 20260922150315.png]]
add chính là [[Residual Block]] (skip-connection) và norm chính là [[Batch Norm Layer]]