## Định Nghĩa 
là một phương pháp [[Tokenize]] dưới dạng subword, bằng việc tính xác suất các kí tự và thực hiện cắt tỉa trên bộ [[Vocabulary]] khổng lồ ban đầu (đây là hướng tiếp cận top-down)
các bước:
- khởi tạo bộ vocab khổng lồ ban đầu
- tính xác suất từng subword dựa trên tần suất xuất hiện của nó 
- thực hiện tách từ bằng thuật toán [[Viterbi]] sao cho xác suất là cao nhất, **:** Một từ có thể có nhiều cách chia (ví dụ: `hugging` -> `['hugg', 'ing']` hoặc `['h', 'ug', 'ging']`). Thuật toán Viterbi được sử dụng để tìm ra chuỗi phân mảnh có xác suất cao nhất.
- Thuật toán tính toán độ giảm likelihood của toàn bộ training data (loss) nếu một token cụ thể bị xóa khỏi tập từ vựng.
- Sắp xếp các token theo độ loss và loại bỏ khoảng $10\% - 20\%$ các token có loss thấp nhất (những token ít đóng góp nhất vào việc biểu diễn văn bản