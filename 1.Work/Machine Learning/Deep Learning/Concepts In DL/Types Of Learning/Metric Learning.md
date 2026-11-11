## Định Nghĩa 
Metric Learning là một hướng tiếp cận mà model có khả năng đưa ra các [[Embeddings]] sao cho distance functions (như [[Cosine Similarity]], ...) có thể đo lường sự tương đồng giữa các chúng nó một cách có ý nghĩa (hai mẫu dữ liệu có mqh tương đồng nhau thì phải có [[Embeddings]] nằm gần nhau)

## Cách Tiếp Cận 
[[Siamese Network]], [[Contrastive Learning]], ... là một ví dụ điển hình cho phương pháp học này 

> [!NOTE] 
> Các mạng phân loại bình thường tạo ra embeddings có ý nghĩa về mặt phân loại (tìm [[Decision Boundary]]) nhưng không có ý nghĩa về khoảng cách (cho 2 tấm ảnh chó khác nhau vào mạng phân loại cho ra 2 embeddings A và B, khi sử dụng A và B ta vẫn sẽ phân loại được hai tụi nó là chó nhưng khi đặt A và B lên [[Vector Space]], tụi nó có thể sẽ không nằm gần nhau)

