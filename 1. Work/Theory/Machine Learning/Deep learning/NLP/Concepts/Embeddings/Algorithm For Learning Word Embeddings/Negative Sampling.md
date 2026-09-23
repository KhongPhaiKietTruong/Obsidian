## Định Nghĩa 
trong [[Word2Vec]] skip-gram, ta phải tính [[Softmax]] trên toàn bộ từ trên [[Vocabulary]] để tính được [[Loss Function|Loss Function]] 

có phương pháp hiệu quả hơn là biến vấn đề đó thành binary classification khi mà ta tạo các positive pair có y = 1 và negative pair có y = 0, sau đó dùng [[Sigmoid]] và [[Binary Cross Entropy (BCE)]] để train 
![[Pasted image 20260919164126.png]]khi đó để tính được loss, ta chỉ cần tính [[Binary Cross Entropy (BCE)]]

Hyperparameters:
- k: số lượng mẫu negative (chọn k = 5-20 nếu [[Training Set]] nhỏ và k = 2-5 nếu training set  lớn )
## Ưu Điểm 
- giúp giảm chi phí tính toán đi nhiều so với dùng [[Softmax]] truyền thống 

## Nhược Điểm 
- các pair có thể quá dễ khiến việc học không tốt 

## Nơi Sử Dụng
được dùng trong skip-gram của seq2seq 