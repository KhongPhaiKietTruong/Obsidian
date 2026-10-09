## Định Nghĩa 
Word2Vec là một phương pháp dùng để học [[Word Embeddings]] bằng [[Neural Network]] 

có hai loại architecture phổ biến cho thuật toán này:
- CBOW (Continuous Bag Of Words): dự đoán từ nằm giữa dựa trên những từ ở xung quanh (trước và sau)
- Skip-gram: cho sẵn từ nằm giữa, dự đoán những từ xung quanh nó
## Tối Ưu Skip-gram
- có thể thực hiện tối ưu skip-gram bằng phương pháp [[Negative Sampling]] hoặc [[Hierarchiral Softmax Classifier]] 

## Nhược Điểm 
- Một từ tương ứng với một [[Ebeddings]], không mang tính ngữ cảnh, bank trong "im going to the bank" và "sit on the river bank" mang cùng một embeddings
- không thể xử lí được [[OOV]] 