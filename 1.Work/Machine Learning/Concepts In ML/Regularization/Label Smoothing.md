## Định Nghĩa 
Label Smoothing là một kĩ thuật [[Regularization]] dùng trong bài toán [[1.Work/Machine Learning/Concepts In ML/Type Of Tasks In ML/Classification/Classification]] giúp mô hình không quá tự tin vào dự đoán của nó 

dùng khắc phục hạn chế của [[One-hot Encoding]], giả sử nhãn của một mẫu là \[0, 1, 0] thì model phải đẩy $z_{2}$ lên rất cao ($+\infty$) so với các z khác để có được nhãn $\approx$ 1 khiến mô hình quá tự tin (one-hot yêu cầu model phải cho ra xác suất của mẫu đúng là 1, nhưng việc này là không thể vì hàm softmax có vùng bão hòa, khiến cho model liên tục update mà không dừng lại, gây ra [[Overfitting - High Variance]])

thay vì gán 1 và 0 thì ta sẽ "làm mềm" nó lại
ví dụ: với $\epsilon=0.1$ \[0, 1, 0] -> \[0.02, 0.92, 0.02] 
$$y'_k = (1 - \epsilon) \cdot y_k + \frac{\epsilon}{K}$$
## Sử Dụng
- khắc phục được điểm yếu của [[One-hot Encoding]] khi kết hợp với [[Cross-Entropy Loss]] khiến mô hình [[Overfitting - High Variance]] 