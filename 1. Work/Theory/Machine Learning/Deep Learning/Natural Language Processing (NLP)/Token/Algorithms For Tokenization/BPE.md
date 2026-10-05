viết tắt của: Byte Pair Encoding 
## Định Nghĩa
BPE là một thuật toán dùng để [[Tokenize]] [[Corpus]] thành các subword bằng việc bắt đầu với một bộ [[Vocabulary]] gồm các kí tự xuất hiện trong corpus, rồi dựa trên tuần suất mà chúng nó xuất hiện kế nhau mà hợp 2 token lại thành 1 

Giả sử chúng ta có một corpus rất nhỏ với tần suất các từ như sau:
l o w </w> : 5 lần
l o w e s t </w> : 2 lần
n e w e r </w> : 6 lần
w i d e r </w> : 3 lần
**Vòng lặp 1:**
Cặp ký tự xuất hiện liền kề nhiều nhất là e và r (9 lần: 6 trong newer + 3 trong wider).
Thuật toán gộp chúng lại -> Sinh ra token mới er.
Tập dữ liệu giờ trở thành: n e w er </w>, w i d er </w>, v.v.
**Vòng lặp 2:**
Cặp liền kề nhiều nhất lúc này là er và </w> (9 lần).
Thuật toán gộp chúng -> Sinh ra token mới er</w>.
**Vòng lặp 3:**
Quay lại các từ khác, cặp l và o xuất hiện 7 lần (5 trong low + 2 trong lowest).
Thuật toán gộp chúng -> Sinh ra token mới lo.
Quá trình cứ thế diễn ra. Kết quả cuối cùng là các từ phổ biến (như "low") sẽ được gộp thành một token duy nhất low</w>. Trong khi đó, từ "lowest" có thể chưa đủ phổ biến để gộp hết, nó sẽ tồn tại dưới dạng hai token subword là low và est</w>.
## Ưu Điểm 
- giải quyết gần như hoàn toàn vấn đề [[OOV]] do biển diễn theo subword 