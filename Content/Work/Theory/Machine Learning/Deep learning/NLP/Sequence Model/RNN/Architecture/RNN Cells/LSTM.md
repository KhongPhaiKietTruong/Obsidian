viết tắt của: Long Short-Term Memory 

là một biến thể của [[vanilla RNN unit]], cũng giúp giảm bớt vấn [[Vanishing Gradient (Tiêu Biến Gradient)]] của [[Vanilla RNN]], cũng khá tương tự với [[GRU]] có 2 gate thì LSTM có 3 gate, mỗi gate điều khiển một vấn đề riêng:
- forget gate: kiểm soát lượng thông tin được giữ lại 
- input gate: kiểm soát lượng thông tin mới sẽ đóng góp vào bao nhiêu
- output gate: kiểm soát lượng thông tin cell state hiện tại xuất ra thành hidden state 

LSTM thường là lựa chọn mặc định do tồn tại đã lâu và có sự linh hoạt cao