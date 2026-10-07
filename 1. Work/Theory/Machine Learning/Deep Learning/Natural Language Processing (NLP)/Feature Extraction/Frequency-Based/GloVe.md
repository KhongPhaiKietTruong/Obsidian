viết tắt của: Global Vector for Word Representation 
## Định Nghĩa
là một phương pháp học theo kiểu:
<center>"những từ xuất hiện trong context giống nhau thì sẽ có ebeddings giống nhau"</center>
bằng cách xây dựng ma trận đồng xuất hiện (co-occurence matrix), mà ma trận thể hiện số lần mà hai từ xuất hiện kế nhau trong [[Training Set]]
![[Pasted image 20260919170713.png|562]]
## Nhược Điểm 
- Một từ tương ứng với một [[Ebeddings]], không mang tính ngữ cảnh, bank trong "im going to the bank" và "sit on the river bank" mang cùng một embeddings
- Không xử lí được [[OOV]] 

cần tìm hiểu kĩ thêm ở course 5 week 2
