trong [[Word2Vec]] skip-gram, ta phải tính [[Softmax]] trên toàn bộ từ trên [[Vocabulary]] để tính được [[Content/Work/Theory/Machine Learning/Fundamentals/Concepts/Loss function|Loss function]] 

có phương pháp hiệu quả hơn là biến vấn đề đó thành binary classification khi mà ta tạo các positive pair có y = 1 và negative pair có y = 0, sau đó dùng [[Sigmoid]] và [[Binary Cross Entropy Loss (BCE)]] để train 
![[Pasted image 20260919164126.png]]khi đó để tính được loss, ta chỉ cần tính [[Binary Cross Entropy Loss (BCE)]]

Hyperparameters:
- k: số lượng mẫu negative (chọn k = 5-20 nếu [[Training Set]] nhỏ và k = 2-5 nếu training set  lớn )
