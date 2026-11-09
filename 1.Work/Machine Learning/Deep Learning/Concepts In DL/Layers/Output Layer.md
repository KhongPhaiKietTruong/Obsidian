Output layer là layer nằm ở cuối một mạng [[Neural Network]], dùng để xuất ra kết quả cuối cùng của bài toán mà ta đang giải quyết

có nhiều loại output layer để phù hợp với tác vụ bài toán đang xử lí, một số loại output layer:

| Task                       | Output Layer thường dùng       | Output                        |
| -------------------------- | ------------------------------ | ----------------------------- |
| Binary Classification      | Linear + Sigmoid               | Xác suất 0–1                  |
| Multi-class Classification | Linear + Softmax               | Xác suất từng class           |
| Multi-label Classification | Linear + Sigmoid               | Xác suất từng nhãn            |
| Regression                 | Linear                         | Giá trị liên tục              |
| Semantic Segmentation      | Conv2d + Softmax (hoặc logits) | Dự đoán class cho từng pixel  |


