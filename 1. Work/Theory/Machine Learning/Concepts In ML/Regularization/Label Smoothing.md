## Định Nghĩa 
Label Smoothing là một kĩ thuật [[Regularization]] dùng trong bài toán [[Classification]] giúp mô hình không quá tự tin vào dự đoán của nó
khắc phục hạn chế của [[One-hot Encoding]], thay vì gán 1 và 0 thì ta sẽ "làm mềm" nó lại
ví dụ: \[1, 0, 1] -> \[0.92, 0.8, 0.8] 
$$y'_k = (1 - \epsilon) \cdot y_k + \frac{\epsilon}{K}$$
## Sử Dụng
- khắc phục được điểm yếu của [[One-hot Encoding]] khiến mô hình quá tự tin 