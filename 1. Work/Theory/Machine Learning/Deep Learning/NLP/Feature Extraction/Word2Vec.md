## Định Nghĩa 
Word2Vec là một phương pháp dùng để học [[Word Embeddings]] bằng [[Neural Network (Mạng Neural)]] 

có hai loại architecture phổ biến cho thuật toán này:
- CBOW (Continuous Bag Of Words): dự đoán từ nằm giữa dựa trên những từ ở xung quanh (trước và sau)
- Skip-gram: cho sẵn từ nằm giữa, dự đoán những từ xung quanh nó 
![[Pasted image 20260919161134.png]]
## Nhược Điểm 
- Một từ tương ứng với một [[Ebeddings]], không mang tính ngữ cảnh, bank trong "im going to the bank" và "sit on the river bank" mang cùng một embeddings