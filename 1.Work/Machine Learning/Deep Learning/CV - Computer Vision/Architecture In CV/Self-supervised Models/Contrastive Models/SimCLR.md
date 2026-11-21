## Định Nghĩa 
SimCLR là một mô mình học thuộc [[Self-Supervised Learning]] sử dụng [[Contrastive Learning]] với ý tưởng chính: hai biến thể tăng cường của cùng một ảnh phải có [[Embeddings]] gần nhau và embeddings của những ảnh khác nhau phải nằm xa nhau trong [[Vector Space]] 

## Cơ Chế Hoạt Động 
Bước 1: Tạo ra hai biến thể được tăng cường khác nhau từ cùng một ảnh input
Bước 2: Trích xuất đặc trưng của hai ảnh
Bước 3: kéo gần khoảng cách [[Embeddings]] của hai ảnh đó lại bằng NT-Xent Loss (một loại loss được đề xuất cho mô hình này)
![[Pasted image 20261111092117.png]]
