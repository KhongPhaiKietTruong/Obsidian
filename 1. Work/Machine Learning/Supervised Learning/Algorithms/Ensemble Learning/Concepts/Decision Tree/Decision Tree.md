## Định Nghĩa 
là một thuật toán gồm 3 thành phần cơ bản: root node, decision node, leaf node với:
- decision node là một đặc trưng ta chọn để chia thành 2 nhóm sao cho đạt độ thuần khiết cao nhất 
- leaf node chính là kết quả cuối cùng 
ví dụ bài toán phân loại mèo: ![[Pasted image 20260902141341.png]]
## Đặc Điểm
- [[Normalization]] sẽ không có tác dụng đối với Decision Tree 
- Sử dụng một cây quyết định để làm model rất dễ gây ra [[Overfitting - High Variance]] nếu không có cắt tỉa, đây cũng là lí do ra đời của [[Tree Ensemble]] 
## Sử Dụng
thuật toán này được trong trong cả dạng toán phân loại và hồi quy 