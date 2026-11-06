| Đặc điểm                 | BatchNorm          | LayerNorm               | GroupNorm    |
| ------------------------ | ------------------ | ----------------------- | ------------ |
| Chia theo                | Batch              | Feature của từng sample | Nhóm channel |
| Thống kê phụ thuộc batch | Có                 | Không                   | Không        |
| Running statistics       | Có                 | Không                   | Không        |
| Batch size nhỏ           | Thường kém ổn định | Tốt                     | Tốt          |
| CNN                      | Phổ biến           | Ít phổ biến hơn         | Phổ biến     |