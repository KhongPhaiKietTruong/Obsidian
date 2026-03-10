P là xác xuất mô hình dự đoán đúng (độ tự tin của mô hình)
1 / P là [[độ ngạc nhiên]] của mô hình

### loss = log(1/P)

lí do ta thêm log là vì, khi mô hình tự tin 100% (P=1), độ ngạc của nó sẽ là 1, một con số không hoàn hoản, vì nếu mô hình tự tin một cách chắc chắn như vậy thì nó không phải ngạc nhiên, ta thêm log để giải quyết vấn đề này, khi mô hình tự tin chắc chắn thì độ ngạc nhiên của nó sẽ là 0