k: số lượng mẫu negative

trong [[Word2Vec]] skip-gram, ta phải tính [[Softmax]] với số lượng nhãn rất lớn để tính được [[Content/Work/Theory/Machine Learning/Foundations/Concepts/Loss function|Loss function]] 

có phương pháp hiệu quả hơn là biến vấn đề đó thành binary classification khi mà ta tạo các positive pair đại diện cho [[Target Value]] và negative pair đại diện cho các mẫu trong [[Training Set]] 
![[Pasted image 20260919164126.png]]