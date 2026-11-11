dịch: học tự huấn luyện 
## Định Nghĩa 
Self-Training là một dạng [[Semi-Supervised Learning]] khi mà ta dùng model được train trên labeled data rồi dùng model đó dự đoán ra các pseudo-label cho unlabeled data, nếu các pseudo-label có độ tự tin đủ cao thì đưa mẫu đó vào [[Training Set]] để huấn luyện tiếp, quá trình này có thể lặp đi lặp lại nhiều lần 

## Nhược Đỉểm 
- có thể khiến model tệ hơn khi mà ta có thể vô tình củng cố các dự đoán sai của nó 