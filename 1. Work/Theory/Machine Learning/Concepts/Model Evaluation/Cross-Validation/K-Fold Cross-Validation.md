dịch: kiểm chứng chéo
## Định Nghĩa 
là phương pháp mà chia dữ liệu ra thành k phần bằng nhau (k fold), sau đó thực hiện train và đánh giá nó trong k round, mỗi round thì sẽ chọn phần thứ i (i=\[1, k]) làm [[Validation Set - Dev Set]], các phần còn lại thì làm [[Training Set]] sau đó sẽ tính ra được metric đánh giá, sau đó lấy trung bình cộng các metric của từng round lại thành metric tổng thể để đánh giá model
## Công Dụng
- dùng để đánh giá [[Generalization]] của mô hình
- dùng để chọn các hyperparameters 