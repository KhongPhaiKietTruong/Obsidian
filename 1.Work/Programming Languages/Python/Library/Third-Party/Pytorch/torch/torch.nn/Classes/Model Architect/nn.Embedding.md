## Định Nghĩa 
nn.Embedding là một lớp dùng để chuyển các [[Token ID]] trong một chuỗi text thành các [[Embeddings]] 

cú pháp:
```python
embedidng = nn.Embedding(num_embeddings, embedding_dim)
```
với: 
- num_embedings: số lượng từ trong [[Vocabulary]] 
- embedding_dim: số chiều của mỗi vector embedding của một wfu