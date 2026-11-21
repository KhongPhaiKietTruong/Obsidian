## Định Nghĩa 
Triplet loss có công thức: 
$$L(A,P,N)=\max(\|f(A)-f(P)\|^2-\|f(A)-f(N)\|^2+\alpha,0)$$
với:
- A là Anchor: ảnh mẫu
- P là Positive: ảnh cùng nhãn với ảnh mẫu 
- N là Negative: ảnh khác nhãn 
- $\alpha$ là khoảng cách tối thiểu mà ta quy định giữa hai anchor và negative  

nên chọn những "hard triplet" để mạng có thể học được nhiều
![[Pasted image 20260917205648.png|547]]