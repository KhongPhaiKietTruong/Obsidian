viết tắt của Gated Recurrent Unit 

là một biến thể của [[RNN unit]], hoặc cũng có thể gọi là biến thể của [[Vanilla RNN]] 
giúp giảm bớt vấn đề [[Vanishing Gradient (Tiêu Biến Gradient)]] bằng cách cho thêm 2 gates vào mỗi unit, mỗi gate để kiểm soát một vấn đề nhất định:
- update gate $z_{t}$: quyết định xem bao nhiêu phần thông tin cũ được giữ lại và mức độ sử dụng thông tin mới 
- reset gate $r_{t}$: quyết định xem bao nhiêu phần thông cũ sẽ được sử dụng để tính giá trị mới 
reset gate này được dùng để tính phần đề xuất (candidate), update gate giúp trộn phần đề xuất đó với [[Pre-activation Value z]] 