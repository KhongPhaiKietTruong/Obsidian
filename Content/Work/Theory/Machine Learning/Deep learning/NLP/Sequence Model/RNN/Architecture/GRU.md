viết tắt của Gated Recurrent Unit 

là một biến thể của [[RNN unit]], hoặc cũng có thể gọi là biến thể của [[Vanilla RNN]] 
giúp giải quyết vấn đề [[Vanishing Gradient (Tiêu Biến Gradient)]] bằng cách cho thêm 2 gates vào mỗi unit, mỗi gate để kiểm soát một vấn đề nhất định:
- update gate $z_{t}$: quyết định xem bao nhiêu phần của các thông tin cũ được giữ lại 
- reset gate $r_{t}$: quyết định xem bao nhiêu phần thông cũ sẽ bị bỏ đi khi tính giá trị mới 
hai gate này được dùng để tính [[Pre-activation Value z]] cuối cùng, 